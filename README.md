# Librarium

Docker image built on top of [linuxserver's calibre image](https://hub.docker.com/r/linuxserver/calibre), to automate the move of new books to the library.

This image configures a cronjob that will run regularly to move books from `/books/new` to `/library` and ensures the default user can access this `/library` directory and its content.
