# docker-mpdsnap

This repository contains a `docker-compose.yml` file that runs 3 containers:
* `mpd` - [Music Player Daemon](https://www.musicpd.org)
* `ympd` - [MPD Web UI](https://www.ympd.org/)
* `snapcast` - [SnapCast server](https://github.com/badaix/snapcast)

They are all based on Alpine linux - ideal for running on a NAS, or anything that can run Docker.

`mpd` outputs audio to a named pipe `mpdstate/snapfifo` which is also mounted into the `snapcast` container, which reads from there. `mpd` also stores its database and playlists in `mpdstate`. A `run.sh` script is included to automate the setup process.

## Requirements
* `docker`
* `docker-compose`
* `snapclient` installed locally
* Some music

## How to use:

* Copy the file `example.env` to `.env` and edit it as required.
* Execute `./run.sh` and ensure that all the containers are healthy via `docker-compose ps`.
* Open `http://$HOSTNAME:8080` (or whatever you changed `YMPD_PORT` to) and queue up some music
* Run `snapclient -h $HOST` and enjoy. 
* Alternatively, open `http://localhost:6680/mpd.ogg` in your preferred music player (`vlc` works perfectly).

## Inspiration and thanks

* [skalavala's writeup](https://github.com/skalavala/Multi-Room-Audio-Centralized-Audio-for-Home)
* [vimagick's mpd Dockerfile](https://github.com/vimagick/dockerfiles/tree/master/mpd)
* [VITIMan's docker-music-stack](https://github.com/VITIMan/docker-music-stack)
* Probably many others

## Contributions

MRs are welcome!
