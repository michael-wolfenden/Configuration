@echo off
copy /u nul %4
start /wait /d "C:\program files\perforce" p4merge.exe -dw -nl %6 -nr %7 -nm %9 -nb %8 %3 %1 %2 %4
