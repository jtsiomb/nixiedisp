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
#ifndef MAINWIN_H_
#define MAINWIN_H_

#include <QMainWindow>

namespace Ui {
	class MainWin;
}

class MainWin : public QMainWindow {
	Q_OBJECT

private:
	Ui::MainWin *ui;

public:
	explicit MainWin(QWidget *parent = 0);
	~MainWin();

	void uiactive(bool act);
	void updateui_clock();

private slots:
	void on_tabs_currentChanged(int index);
	void on_bn_timer_startstop_toggled();
	void on_bn_timer_reset_clicked();
	void on_chk_clock_zeros_stateChanged(int arg1);
	void on_chk_clock_showsec_stateChanged(int arg1);
	void on_slider_clock_hrsep_valueChanged(int pos);
	void on_frm_dimsec_toggled(bool arg1);
	void on_slider_clock_dimsec_valueChanged(int pos);
	void on_rad_clock_24hr_toggled(bool checked);
	void on_rad_clock_12hr_toggled(bool checked);
	void on_bn_setclock_sys_clicked();
	void on_bn_set_time_clicked();
	void on_bn_set_date_clicked();
	void on_bn_updclock_clicked();
	void on_rad_dev_usb_toggled(bool checked);
	void on_rad_dev_serial_toggled(bool checked);
	void on_cbox_devsel_currentIndexChanged(int idx);
	void on_slider_intglobal_valueChanged(int pos);
	void on_chk_blank_stateChanged(int arg1);
	void on_rad_x_instant_toggled(bool checked);
	void on_rad_x_fade_toggled(bool checked);
	void on_time_cycle_userTimeChanged(const QTime &time);
	void on_bn_runcycle_clicked();
	void on_spin_shownum_valueChanged(double arg1);
};

#endif	/* MAINWIN_H_ */
