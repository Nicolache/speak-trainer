# Usage: ./speak-trainer.sh ru-esp.txt
#!/bin/bash
WORKFILE=$1
cp $WORKFILE $WORKFILE.sav
cat $WORKFILE | tail +2 | awk '/..\/..\/202./ {exit} {print}' - | sed -n '4~4p' > my.tmp
cat $WORKFILE | tail +2 | awk '/..\/..\/202./ {exit} {print}' - | sed -n '5~4p' > goog.tmp


head -1 $WORKFILE > renew-workfile.tmp
cat $WORKFILE | tail +2 | awk '/..\/..\/202./ {exit} {print}' - >> renew-workfile.tmp
wdiff -s3 my.tmp goog.tmp >> renew-workfile.tmp
cat $WORKFILE | tail +2 | awk '/..\/..\/202./,0' - >> renew-workfile.tmp

mv renew-workfile.tmp $WORKFILE
rm my.tmp
rm goog.tmp
