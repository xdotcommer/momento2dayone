Momento => Day One Importer
===========================

This is a simple ruby script to import the data from "Momento" into "DayOne".

Here are the steps you'll need to do:
# Firts make sure "dayone" is in your path: ln -s /Applications/Day\ One.app/Contents/MacOS/dayone /usr/local/usr/bin/dayone
# Clone the repo: git clone git://github.com/xdotcommer/momento2dayone.git
# Make the script executable: cd momento2dayone ; chmod a+x momento2dayone
# Run it on a file, set of files, or stdin: ./momento2dayone momento_export.txt