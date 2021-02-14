/*
nixiedisp-gui - settings and control app for the nixie tube display
Copyright (C) 2021  John Tsiombikas <nuclear@member.fsf.org>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
#include <stdio.h>
#include <QMessageBox>
#include <QSettings>
#include "mainwin.h"
#include "ui_mainwin.h"
#include "dev.h"
#include "uimsg.h"

static struct device *dev;

MainWin::MainWin(QWidget *parent)
	: QMainWindow(parent)
{
	ui = new Ui::MainWin;
	ui->setupUi(this);

	ui->time_edit->setDisplayFormat("hh:mm.ss");
	ui->date_edit->setDisplayFormat("d MMM yyyy");

	ui->cbox_devsel->setCurrentIndex(0);
	ui->cbox_devsel->addItem("<none>", QVariant::fromValue((void*)0));
	if(dev_scan() != -1) {
		QSettings cfg;
		QString devpathstr = cfg.value("devpath").toString();

		int idx = 0, sel = 0;
		struct device *d = devlist;
		while(d) {
			++idx;
			ui->cbox_devsel->addItem(d->name, QVariant::fromValue((void*)d));
			if(devpathstr == QString(d->name)) {
				sel = idx;
			}

			d = d->next;
		}

		if(sel) {
			ui->cbox_devsel->setCurrentIndex(sel);
		}
	}
}

MainWin::~MainWin()
{
	delete ui;
}

void MainWin::uiactive(bool act)
{
}

void MainWin::updateui_clock()
{
	on_bn_updclock_clicked();

	int hrmode = dev_clock_get_hrmode(dev);
	switch(hrmode) {
	case 12:
		ui->rad_clock_12hr->setChecked(true);
		on_rad_clock_12hr_toggled(true);
		break;
	case 24:
		ui->rad_clock_24hr->setChecked(true);
		on_rad_clock_24hr_toggled(true);
		break;
	}

	int leadzero = dev_clock_get_leadzero(dev);
	if(leadzero != -1) {
		ui->chk_clock_zeros->setChecked(leadzero != 0);
	}

	int showsec = dev_clock_get_showsec(dev);
	if(showsec != -1) {
		ui->chk_clock_showsec->setChecked(showsec != 0);
	}

	int tmstate = dev_timer(dev, 0);
	if(tmstate != -1) {
		if(tmstate) {
			dev->flags |= DEV_TMRUNNING;
		}
		ui->bn_timer_startstop->setChecked(tmstate ? true : false);
		ui->bn_timer_startstop->setText(tmstate ? "Stop" : "Start");
	}
}

void MainWin::on_rad_dev_usb_toggled(bool checked)
{
}

void MainWin::on_rad_dev_serial_toggled(bool checked)
{

}

void MainWin::on_cbox_devsel_currentIndexChanged(int idx)
{
	int res, val[3];
	QSettings cfg;

	if(idx <= 0) {
		if(dev) {
			dev_close(dev);
			dev = 0;
		}
		uiactive(false);
		return;
	}

	dev = (struct device*)ui->cbox_devsel->itemData(idx).value<void*>();

	if(dev_open(dev) == -1) {
		dev = 0;
		return;
	}

	dev_mask_mod(dev);

	if((res = dev_getmode(dev)) == -1) {
		goto err;
	}
	ui->tabs->setCurrentIndex(res);

	if((res = dev_get_intensity(dev)) == -1) {
		goto err;
	}
	ui->slider_intglobal->setValue(res);

	if((res = dev_getblank(dev)) == -1) {
		goto err;
	}
	ui->chk_blank->setChecked(res ? true : false);

	if(dev_get_sched_cycle(dev, val, val + 1, val + 2) == -1) {
		goto err;
	}
	ui->time_cycle->setTime(QTime(val[0], val[1], val[2]));

	if((res = dev_getfade(dev)) == -1) {
		goto err;
	}
	if(res) {
		ui->rad_x_fade->setChecked(true);
	} else {
		ui->rad_x_instant->setChecked(true);
	}

	if((res = dev_clock_get_hrsep(dev)) == -1) {
		goto err;
	}
	ui->slider_clock_hrsep->setValue(res);

	updateui_clock();
	dev_unmask_mod(dev);

	cfg.setValue("devpath", QString(dev->name));
	return;

err:
	errmsg("Failed to communicate with the device");
	ui->cbox_devsel->setCurrentIndex(0);
	uiactive(false);
	if(dev) {
		dev_close(dev);
		dev = 0;
	}
}

void MainWin::on_tabs_currentChanged(int index)
{
	switch(index) {
	case 0:
		dev_mode(dev, MODE_CLOCK);
		break;
	case 1:
		dev_mode(dev, MODE_TIMER);
		break;
	case 2:
		ui->spin_shownum->setValue(0);
		dev_mode(dev, MODE_NUMBER);
		break;
	}
}

void MainWin::on_bn_timer_startstop_toggled()
{
	if(!dev) return;

	if(dev->flags & DEV_TMRUNNING) {
		unsigned int tm;
		char buf[64];

		dev_timer_stop(dev);
		dev_timer(dev, &tm);

		ui->bn_timer_startstop->setText("Start");
		ui->bn_timer_startstop->setChecked(false);

		sprintf(buf, "last timer: %u msec", tm);
		statusBar()->showMessage(buf, 5000);
	} else {
		dev_timer_start(dev);

		ui->bn_timer_startstop->setText("Stop");
		ui->bn_timer_startstop->setChecked(true);
	}

	dev->flags ^= DEV_TMRUNNING;
}

void MainWin::on_bn_timer_reset_clicked()
{
	dev_timer_reset(dev);
}

void MainWin::on_chk_clock_zeros_stateChanged(int state)
{
	dev_clock_set_leadzero(dev, state == Qt::Checked ? 1 : 0);
}

void MainWin::on_chk_clock_showsec_stateChanged(int state)
{
	dev_clock_set_showsec(dev, state == Qt::Checked ? 1 : 0);
}

void MainWin::on_slider_clock_hrsep_valueChanged(int pos)
{
	dev_clock_set_hrsep(dev, pos);
}

void MainWin::on_frm_dimsec_toggled(bool state)
{
	ui->slider_clock_dimsec->setEnabled(state);
}

void MainWin::on_slider_clock_dimsec_valueChanged(int pos)
{
}

void MainWin::on_rad_clock_24hr_toggled(bool checked)
{
	if(checked) {
		ui->time_edit->setDisplayFormat("hh:mm.ss");
		ui->time_cycle->setDisplayFormat("hh:mm");
		dev_clock_set_hrmode(dev, 24);
	}
}

void MainWin::on_rad_clock_12hr_toggled(bool checked)
{
	if(checked) {
		ui->time_edit->setDisplayFormat("h:mm.s ap");
		ui->time_cycle->setDisplayFormat("h:mm ap");
		dev_clock_set_hrmode(dev, 12);
	}
}

void MainWin::on_bn_setclock_sys_clicked()
{
	QTime tm = QTime::currentTime();
	QDate date = QDate::currentDate();

	dev_clock_set_time(dev, tm.hour(), tm.minute(), tm.second());
	dev_clock_set_date(dev, date.day(), date.month(), date.year());
}

void MainWin::on_bn_set_time_clicked()
{
	QTime tm = ui->time_edit->time();
	dev_clock_set_time(dev, tm.hour(), tm.minute(), tm.second());
}

void MainWin::on_bn_set_date_clicked()
{
	QDate date = ui->date_edit->date();
	dev_clock_set_date(dev, date.day(), date.month(), date.year());
}

void MainWin::on_bn_updclock_clicked()
{
	int val[3];

	if(dev_clock_get_time(dev, val, val + 1, val + 2) != -1) {
		ui->time_edit->setTime(QTime(val[0], val[1], val[2]));
	}
	if(dev_clock_get_date(dev, val, val + 1, val + 2) != -1) {
		ui->date_edit->setDate(QDate(val[2], val[1], val[0]));
	}
}

void MainWin::on_slider_intglobal_valueChanged(int pos)
{
	dev_set_intensity(dev, pos);
}

void MainWin::on_chk_blank_stateChanged(int state)
{
	dev_blank(dev, state == Qt::Checked ? 1 : 0);
}

void MainWin::on_rad_x_instant_toggled(bool checked)
{
	if(checked) {
		dev_setfade(dev, 0);
	}
}

void MainWin::on_rad_x_fade_toggled(bool checked)
{
	if(checked) {
		dev_setfade(dev, 0xff);
	}
}

void MainWin::on_time_cycle_userTimeChanged(const QTime &time)
{
	dev_sched_cycle(dev, time.hour(), time.minute(), time.second());
}

void MainWin::on_bn_runcycle_clicked()
{
	dev_cycle(dev);
}

void MainWin::on_spin_shownum_valueChanged(double val)
{
	dev_number(dev, val);
}

void MainWin::on_action_exit_triggered()
{
	QApplication::quit();
}

void MainWin::on_action_about_triggered()
{
	static const char *aboutstr = "Nixiedisp configuration UI\n"
		"Copyright (c) 2021 John Tsiombikas <nuclear@member.fsf.org>\n"
		"This program is free software. Feel free to use, modify and/or redistribute it\n"
		"under the terms of the GNU General Public License v3 (or later)\n";
	QMessageBox::about(this, "About nixiedisp", aboutstr);
}
