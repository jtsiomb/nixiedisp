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
#include "mainwin.h"
#include "ui_mainwin.h"
#include "dev.h"

MainWin::MainWin(QWidget *parent)
	: QMainWindow(parent)
{
	ui = new Ui::MainWin;
	ui->setupUi(this);

	if(dev_scan() != -1) {
		struct device *d = devlist;
		while(d) {
			ui->cbox_devsel->addItem(QString(d->name));
			d = d->next;
		}
	}
}

MainWin::~MainWin()
{
	delete ui;
}


void MainWin::on_rad_dev_usb_toggled(bool checked)
{
}

void MainWin::on_rad_dev_serial_toggled(bool checked)
{

}

void MainWin::on_cbox_devsel_activated(const QString &arg1)
{

}

void MainWin::on_tabs_current_changed(int index)
{
	switch(index) {
	case 0:
		dev_mode(MODE_CLOCK);
		break;
	case 1:
		dev_mode(MODE_TIMER);
		break;
	case 2:
		dev_mode(MODE_NUMBER);
		break;
	}
}

void MainWin::on_bn_timer_startstop_clicked()
{
	// TODO start timer
}

void MainWin::on_bn_timer_reset_clicked()
{
	// TODO reset timer
}

void MainWin::on_chk_clock_zeros_stateChanged(int arg1)
{
	// TODO
}

void MainWin::on_chk_clock_showsec_stateChanged(int arg1)
{

}

void MainWin::on_frm_dimsec_toggled(bool arg1)
{

}

void MainWin::on_slider_clock_dimsec_slider_moved(int position)
{

}

void MainWin::on_rad_clock_24hr_toggled(bool checked)
{

}

void MainWin::on_rad_clock_12hr_toggled(bool checked)
{

}

void MainWin::on_time_edit_user_time_changed(const QTime &time)
{

}

void MainWin::on_date_edit_user_date_changed(const QDate &date)
{

}

void MainWin::on_slider_intglobal_slider_moved(int position)
{

}

void MainWin::on_chk_blank_state_changed(int arg1)
{

}

void MainWin::on_rad_x_instant_toggled(bool checked)
{

}

void MainWin::on_rad_x_fade_toggled(bool checked)
{

}

void MainWin::on_time_cycle_user_time_changed(const QTime &time)
{

}

void MainWin::on_bn_runcycle_clicked()
{

}

void MainWin::on_spin_shownum_value_changed(double arg1)
{

}
