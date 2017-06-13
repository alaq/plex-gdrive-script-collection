#!/bin/sh

MONITOR="$HOME/activity.log"
. ~/.config/PlexACD/plexacd.conf
. ${bindir}/plexacd.sh

#sonarr
ps auxw | grep "SCREEN -dmS sonarr" | grep -v grep >  /dev/null
if [ $? != 0 ]
then
        screen -dmS sonarr mono --debug /home/soviel/NzbDrone/NzbDrone.exe -c libcurl
        log "sonarr was re-launched" >> "$MONITOR"
fi

#radarr
ps auxw | grep "SCREEN -dmS radarr" | grep -v grep >  /dev/null
if [ $? != 0 ]
then
        screen -dmS radarr mono --debug /home/soviel/Radarr/Radarr.exe -c libcurl
        log "radarr was re-launched" >> "$MONITOR"
fi

#plexpy
ps auxw | grep "SCREEN -dmS plexpy" | grep -v grep >  /dev/null
if [ $? != 0 ]
then
        screen -dmS plexpy .${home}/plexpy/PlexPy.py -p 40017
        log "plexpy was re-launched" >> "$MONITOR"
fi

#jackett
ps auxw | grep "SCREEN -dmS jackett" | grep -v grep >  /dev/null
if [ $? != 0 ]
then
        screen -dmS jackett mono /home/soviel/Jackett/JackettConsole.exe -p 40003 -c libcurl
        log "jackett was re-launched" >> "$MONITOR"
fi

#ombi
ps auxw | grep "SCREEN -dmS ombi" | grep -v grep >  /dev/null
if [ $? != 0 ]
then
        screen -dmS ombi mono ${home}/Ombi/Ombi.exe -c libcurl
        log "ombi was re-launched" >> "$MONITOR"
fi

#autodl
ps auxw | grep "SCREEN -dmS autodl irssi" | grep -v grep >  /dev/null
if [ $? != 0 ]
then
        screen -dmS autodl irssi
        log "autodl irssi was re-launched" >> "$MONITOR"
fi
