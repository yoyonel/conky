if [ ! -x /usr/bin/cmus-remote ];
then
echo "cmus is not installed."
exit
fi

ARTIST=$( cmus-remote -Q 2>/dev/null | grep artist | cut -d " " -f 3- )
TITLE=$( cmus-remote -Q 2>/dev/null | grep title | cut -d " " -f 3- )
ALBUM=$( cmus-remote -Q 2>/dev/null | grep " album " | cut -d " " -f 3- )
VOLUME_LEFT=$( cmus-remote -Q 2>/dev/null | grep vol_left | cut -d " " -f 3- )
VOLUME_RIGHT=$( cmus-remote -Q 2>/dev/null | grep vol_right | cut -d " " -f 3- )
DURATION=$( cmus-remote -Q 2>/dev/null | grep duration | cut -d " " -f 2- )
POSITION=$( cmus-remote -Q 2>/dev/null | grep position | cut -d " " -f 2- )

if [ -z "$ARTIST" ];
then
echo "Nothing"
else
echo "$ARTIST - $ALBUM - $TITLE"
echo "> $POSITION / $DURATION - vol(left/right): $VOLUME_LEFT/$VOLUME_RIGHT"
fi
