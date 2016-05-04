@ECHO OFF
START /WAIT /D "C:\Program Files\Perforce\" p4merge.exe -nl ""%6"" -nr ""%7"" ""%1"" ""%2""
