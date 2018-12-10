:: template for upload file
:: git vcs
:: author @erichm

:: set echo off
@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD% %HH%-%Min%-%Sec%"

:: view status before
echo [INFO] %fullstamp% :preview changes
@echo
git status
@echo off

:: add files for change
echo [INFO] %fullstamp% :adding files
@echo off
git add .
@echo off

:: get status after
echo [INFO] %fullstamp% :preloaded changes
@echo off
git status
@echo off

:: commit changes for file 
echo [INFO] %fullstamp% :commit changes
@echo off
git commit -m "upload file"
@echo off

:: upload changes to remote
echo [INFO] %fullstamp% :uploading started
@echo off
git push origin master
echo [INFO] %fullstamp% :uploading finished
@echo off

:: pause file execution
echo [INFO] %fullstamp% :pausing
@echo off
:: pause

:: exit from file
echo [INFO] %fullstamp% :exiting
@echo off
:: exit