#!/bin/bash

# check if folder is given in arg 
if [ -z "$1" ]; then
  echo "Usage: $0 <chemin_du_dossier>"
  exit 1
fi
# sanitize
folder=$(echo "$1" | sed 's:/*$::')

# check if folder exist
if [ ! -d "$folder" ]; then
  echo "Le dossier $folder n'existe pas."
  exit 1
fi

playlist="playlist.m3u"

playlist_path="$folder/$playlist"
echo $playlist_path
# clear playlist file
> "$playlist_path"

# iterate and creates playlist file
for f in "$folder"/*.mp3; do
  if [ -f "$f" ]; then
    echo "$f" >> "$playlist_path"
  fi
done

echo "Playlist file $playlist_path added succesfully"

