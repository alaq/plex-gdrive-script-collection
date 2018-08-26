#!/bin/sh

MONITOR="$HOME/activity.log"
. ~/.config/PlexACD/plexacd.conf
. ${bindir}/plexacd.sh

#sonarr
screen -ls | grep  sonarr | grep -v grep >  /dev/null
if [ $? != 0 ]
then
        screen -dmS sonarr mono --debug /home/soviel/NzbDrone/NzbDrone.exe -c libcurl
        log "sonarr was re-launched" >> "$MONITOR"
fi

#radarr
screen -ls | grep radarr | grep -v grep >  /dev/null
if [ $? != 0 ]
then
        screen -dmS radarr mono --debug /home/soviel/Radarr/Radarr.exe -c libcurl
        log "radarr was re-launched" >> "$MONITOR"
fi

#plexpy
screen -ls | grep "plexpy" | grep -v grep >  /dev/null
if [ $? != 0 ]
then
        screen -dmS plexpy /home/soviel/plexpy/PlexPy.py -p 40017
        log "plexpy was re-launched" >> "$MONITOR"
fi

#jackett
screen -ls | grep "jackett" | grep -v grep >  /dev/null
if [ $? != 0 ]
then
        screen -dmS jackett mono /home/soviel/Jackett/JackettConsole.exe -p 40003 -c libcurl
        log "jackett was re-launched" >> "$MONITOR"
fi

#ombi
# screen -ls | grep "ombi" | grep -v grep >  /dev/null
# if [ $? != 0 ]
# then
#       screen -dmS ombi mono ${home}/Ombi/Ombi.exe -c libcurl  
#       log "ombi was re-launched" >> "$MONITOR"
# fi

#autodl
screen -ls | grep "autodl" | grep -v grep >  /dev/null
if [ $? != 0 ]
then
        screen -dmS autodl irssi
        log "autodl irssi was re-launched" >> "$MONITOR"
fi
