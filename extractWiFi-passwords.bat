REM         This script exports all WiFi passwords into files.
REM         You must be Admin to run it

netsh wlan show profile
netsh wlan export profile folder=C:\ key=clear


REM         if you want to get a particular key but not export to file:
REM         netsh wlan show profile
REM         netsh wlan show profile <Profile_name> key=clear
