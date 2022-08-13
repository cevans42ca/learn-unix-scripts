FROM alpine

ARG D_GID=10000
ARG D_USERNAME=duser1

RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk add bash-doc
RUN apk add bash-completion
RUN apk add grep
RUN apk add less

# For the "file" command
RUN apk add file

# For fmt
RUN apk add coreutils

# For tput
RUN apk add ncurses

# For man magic
RUN apk add file-doc

# Various documentation
RUN apk add mandoc man-pages mandoc-apropos less less-doc
RUN apk add bash-doc busybox-doc mandoc-apropos coreutils-doc

# For Encrypted, shared directories (also part of the exercises)
RUN apk add encfs encfs-doc

# For mounting ZIP files (part of the exercises)
RUN apk add archivemount archivemount-doc

#encfs /mnt/vol ~/vol
#fusermount -u ~/vol

COPY etc-profile.sh /etc/profile.d/exports.sh
#RUN sed -i "1s;^;export DARK_MODE=${DARK_MODE}\n;" /etc/profile.d/exports.sh

RUN adduser -S $D_USERNAME

ADD bin /home/${D_USERNAME}/bin
ADD launch.sh /usr/local/bin/launch_lus.sh

RUN chown -R ${D_USERNAME} /home/${D_USERNAME}/bin
RUN chmod u+x /home/${D_USERNAME}/bin/*

RUN ln -s /mnt/vol/testuser/lus /home/${D_USERNAME}/lus 
RUN ln -s /mnt/vol/testuser/sandbox /home/${D_USERNAME}/sandbox

VOLUME /mnt/vol

RUN addgroup -g $D_GID lus
RUN addgroup ${D_USERNAME} lus

RUN chown root:lus /usr/local/bin/launch_lus.sh
RUN chmod g+rx /usr/local/bin/launch_lus.sh

USER ${D_USERNAME}
WORKDIR /home/${D_USERNAME}

ENV DARK_MODE=1

RUN echo "export PATH=$PATH:/home/${D_USERNAME}/bin" >> /home/${D_USERNAME}/.bashrc

CMD ["/usr/local/bin/launch_lus.sh"]

