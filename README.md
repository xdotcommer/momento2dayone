Momento => Day One Importer
===========================

This is a simple ruby script to import the data from "Momento" into "DayOne".

Here are the steps you'll need to do:

1. First make sure "dayone" is in your path: `ln -s /Applications/Day\ One.app/Contents/MacOS/dayone /usr/local/usr/bin/dayone`
2. Clone the repo: `git clone git://github.com/xdotcommer/momento2dayone.git`
3. Make the script executable: `cd momento2dayone ; chmod a+x momento2dayone`
4. Run it on a file, set of files, or stdin: `./momento2dayone momento_export.txt`