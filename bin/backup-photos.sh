#!/bin/bash

# disable spotlight indexing during backup
sudo mdutil -i off /Volumes/Photos
sudo mdutil -i off /Volumes/BUPHOTOS

# backup
sudo rsync -vaEPX --exclude=".*" --delete-after --info=progress2 /Volumes/Photos /Volumes/BUPHOTOS
