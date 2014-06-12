:: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ::
:: Batch script to rename files with zero padded number series-prefix			 ::
:: http://kedar.nitty-witty.com								 ::
:: Usage: RenZeroPad.bat <file-extension> <pad-length>					 ::
:: example: RenZeroPad.bat ext 4 will result in "file.ext" renamed to "0001 file.ext"	 ::
:: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ::

@echo off
setLocal EnableDelayedExpansion

set /a cnt=1
for %%i in (*.%1) do ( 
call :Set0Pad %2

set newName=!str! %%i
ren "%%i" "!newName!"
)

:Set0Pad
set padcntr=0000000000%cnt%
set str=%padcntr:~-%1% 
set renstr=%str%
set /a cnt+=1