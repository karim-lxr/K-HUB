rem					sample technojuice - 98
@echo off
rem **************************************************************
rem *								 *
rem *			technojuice - 1998			 *
rem *								 *	
rem *	  		AUTOEXEC.BAT & CONFIG.SYS		 *
rem *	  	    menu sample for Linux boot with loadlin	 *
rem *								 *
rem **************************************************************

 goto %config%
             
             :win 
mode con codepage prepare=((850) C:\WINDOWS\COMMAND\ega.cpi)
mode con codepage select=850
keyb sf,,C:\WINDOWS\COMMAND\keyboard.sys

set PATH=C:\djgpp\djgpp.env;C:\PROGRA~1\ULTRAEDT;C:\PROGRA~1\TCL\bin
set PATH=C:\djgpp\bin;%path%;C:\PROGRA~1\ULTRAEDT;C:\PROGRA~1\TCL\bin
