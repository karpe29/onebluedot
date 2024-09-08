@echo off
powershell.exe -ExecutionPolicy Bypass -File "csv-to-md-converter.ps1"
powershell.exe -ExecutionPolicy Bypass -File "markdown-cleaner.ps1"
echo Conversion and cleaning complete!
pause