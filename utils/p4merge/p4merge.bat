@ECHO OFF
COPY /Y NUL ""%4""
START /WAIT /D "C:\Program Files\Perforce\" p4merge.exe -nb ""%8"" -nl ""%6"" -nr ""%7"" -nm ""%9"" ""%3"" ""%1"" ""%2"" ""%4""
