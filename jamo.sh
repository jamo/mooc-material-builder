#!/usr/local/bin/zsh
LOL="/home/jamo/repos/mooc-material-builder/log/update-preview.log"
echo "" > $LOL
CURRENT=`pwd`

echo "Started at `date`" >> update.log
echo "Started at `date`" 2>&1 >> $LOL
cd /home/jamo/repos/k2014-mooc-materiaali 2>&1 >> $LOL
echo "kansio" >> $LOL
echo "`pwd`" >> $LOL
git pull 2>&1 >> $LOL
git reset --hard origin master
echo "kansiossa `pwd`" >> $LOL

BUNDLE_GEMFILE=/home/jamo/repos/k2014-mooc-materiaali/Gemfile

rake update 2>&1 >> $LOL
rake parse 2>&1 >> $LOL

NOW="p$(date +%s)preview" 2>&1 >> $LOL

env BUILD_DIR=$NOW rake preview 2>&1 >> $LOL

ln -nsf "`pwd`/$NOW" preview 2>&1 >> $LOL

echo "Done at `date` 2>&1" >> $LOL

cd $CURRENT 2>&1 >> $LOL
echo "  Done at `date`" 2>&1 >> update.log
