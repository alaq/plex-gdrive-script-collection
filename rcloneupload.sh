#!/bin/bash

SORTLOG="$HOME/activity.log"
#below path must have trailing slash
MOVIECRYPT='crypt:incomimg/movies/'
TVCRYPT='crypt:incoming/tv/'
RADARRDIR="$HOME/upload/incoming/radarr/"
SONARRDIR="$HOME/upload/incoming/sonarr/"
FLEXGETMOVIEDIR="$HOME/flexget-processing/movies/"
FLEXGETTVDIR="$HOME/flexget-processing/tv/"
lock="${HOME}/.config/PlexACD/rclone-lock"
. /home/soviel/bin/plexacd.sh

log "$3 has been downloaded $1" >> $SORTLOG

while [ -f "${lock}" ] ;
do
        sleep 60
done


if [ "$1" == "radarr" ]; then
        log "Copying file -> $2" >> $SORTLOG
        echo "cp" > ${lock}
        cp -r "$2" "$RADARRDIR"
        log "Copy completed -> /upload/incoming/radarr/$3" >> $SORTLOG
        rm ${lock}
fi

if [ "$1" == "tv-sonarr" ]; then
        log "Copying file -> $2" >> $SORTLOG
        echo "cp" > ${lock}
        cp -r "$2" "$SONARRDIR"
        log "Copy completed -> /upload/incoming/sonarr/$3" >> $SORTLOG
        rm ${lock}
fi

if [ "$1" == "movies-manual" ]; then
        log "Copying file -> $2" >> $SORTLOG
        echo "cp" > ${lock}
        cp -r "$2" "$FLEXGETMOVIEDIR"
        log "Copy completed -> /upload/movies/$3" >> $SORTLOG
        /home/soviel/virtualenv2/bin/flexget execute --tasks sort-movies
        if [ "$(ls -A $FLEXGETMOVIEDIR)" ]; then
                log "flexget couldnt identify movie automatically, please advise" >> $SORTLOG
        else
                log "flexget moved movie for upload" >> $SORTLOG
        fi
        rm ${lock}
fi

if [ "$1" == "tv-manual" ]; then
        log "Copying file -> $2" >> $SORTLOG
        echo "cp" > ${lock}
        cp -r "$2" "$FLEXGETTVDIR"
        log "Copy completed -> /upload/tv/$3" >> $SORTLOG
        /home/soviel/virtualenv2/bin/flexget execute --tasks sort-tv
        if [ "$(ls -A $FLEXGETTVDIR)" ]; then
                log "flexget couldnt identify series automatically, please advise" >> $SORTLOG
        else
                log "flexget moved series for upload" >> $SORTLOG
        fi
        rm ${lock}
fi
