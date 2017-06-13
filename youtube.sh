#!/bin/sh

MONITOR="$HOME/activity.log"
. ~/.config/PlexACD/plexacd.conf
. ${bindir}/plexacd.sh

# Downloading up to 50 new videos
log "starting youtube download" >> "$MONITOR"
${bindir}/youtube-dl --max-downloads 20 --playlist-reverse --download-archive /home/soviel/scripts/downloaded.txt -i -o "/home/soviel/youtube/%(uploader)s/%(uploader)s - S01E%(playlist_index)s - %(title)s [%(id)s].%(ext)s" -f bestvideo[ext=mp4]+bestaudio[ext=m4a] --merge-output-format mp4 --add-metadata --write-thumbnail --batch-file=/home/soviel/scripts/channel_list.txt

# Move to upload
mv /home/soviel/youtube/* /home/soviel/upload/youtube
log "youtube download and move completed" >> "$MONITOR"
