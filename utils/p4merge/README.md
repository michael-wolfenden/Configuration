# Configure Visual Studio

## Tools > Options… > Source Control > Visual Studio Team Foundation Server

### Diff

* Extension: .*
* Operation: Compare
* Command: C:\utils\p4merge\p4diff.bat
* Arguments: %1 %2 “x” “x” “x” %6 %7

### Merge

* Extension: .*
* Operation: Merge
* Command: C:\utils\p4merge\p4merge.bat
* Arguments: %1 %2 %3 %4 “x” %6 %7 %8 %9