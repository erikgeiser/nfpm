FROM ubuntu
ARG package
COPY ${package} /tmp/foo.deb
RUN dpkg -i /tmp/foo.deb
RUN apt-cache show /tmp/foo.deb | grep "Depends: bash"
RUN apt-cache show /tmp/foo.deb | grep "Suggests: zsh"
RUN apt-cache show /tmp/foo.deb | grep "Recommends: fish"
RUN test -e /usr/local/bin/fake
RUN test -f /etc/foo/whatever.conf
RUN test -d /usr/share/whatever/
RUN test -d /usr/share/whatever/folder
RUN test -f /usr/share/whatever/folder/file1
RUN test -f /usr/share/whatever/folder/file2
RUN test -d /usr/share/whatever/folder/folder2
RUN test -f /usr/share/whatever/folder/folder2/file1
RUN test -f /usr/share/whatever/folder/folder2/file2
RUN test -d /var/log/whatever
RUN test -d /usr/share/foo
RUN test -f /tmp/preinstall-proof
RUN test -f /tmp/postinstall-proof
RUN test ! -f /tmp/preremove-proof
RUN test ! -f /tmp/postremove-proof
RUN echo wat >> /etc/foo/whatever.conf
RUN dpkg -r foo
RUN test -f /etc/foo/whatever.conf
RUN test ! -f /usr/local/bin/fake
RUN test -f /tmp/preremove-proof
RUN test -f /tmp/postremove-proof
RUN test ! -d /var/log/whatever
RUN test ! -d /usr/share/foo
