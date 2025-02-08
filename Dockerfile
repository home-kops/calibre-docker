ARG CALIBRE_VERSION="7.25.0"

FROM lscr.io/linuxserver/calibre:${CALIBRE_VERSION}

RUN apt update

# Install nano to allow editing of crontab
RUN apt install nano

RUN mkdir /library && \
    chown kasm-user:kasm-user /library

COPY files/move_books /move_books

RUN chmod +x /move_books

RUN crontab -l > /cronjobs || true && \
    echo "*/2 * * * * /move_books" >> /cronjobs && \
    crontab /cronjobs && \
    /etc/init.d/cron reload
