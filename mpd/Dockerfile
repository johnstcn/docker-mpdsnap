FROM alpine:latest
ARG MPD_UID
ARG MPD_GID
RUN apk add mpd shadow && \
	usermod -u ${MPD_UID} -g ${MPD_GID} mpd && \
	mkdir -p /var/lib/mpd/media && \
	mkdir -p /var/lib/mpd/playlists && \
	chown -R ${MPD_UID}:${MPD_GID} /var/lib/mpd && \
	apk del shadow
EXPOSE 6600
USER mpd
CMD ["mpd", "--stdout", "--no-daemon", "/var/lib/mpd/mpd.conf"]
