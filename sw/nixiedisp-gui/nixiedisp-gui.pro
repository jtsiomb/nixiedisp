QT += core gui widgets
CONFIG += debug
TARGET = nixiedisp-gui

SOURCES += src/main.cc src/mainwin.cc
HEADERS += src/mainwin.h
FORMS += ui/mainwin.ui

unix {
	SOURCES += src/dev_unix.c
}

win32 {
	SOURCES += src/dev_win.c
}

isEmpty(PREFIX) {
	PREFIX = /usr/local
}

target.path = $$PREFIX/bin
target.files += $$TARGET
INSTALLS += target