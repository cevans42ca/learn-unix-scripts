FROM alpine

ARG D_GID=10000
ARG D_USERNAME=duser1
ARG DARK_MODE=1

RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk add bash-doc
RUN apk add bash-completion
RUN apk add grep
RUN apk add coreutils
RUN apk add less

COPY PS1.sh /etc/profile.d/PS1.sh
RUN sed -i "1s;^;export DARK_MODE=${DARK_MODE}\n;" /etc/profile.d/PS1.sh

RUN adduser -S $D_USERNAME

ADD bin /home/${D_USERNAME}/bin
RUN chown -R ${D_USERNAME} /home/${D_USERNAME}/bin
RUN chmod u+x /home/${D_USERNAME}/bin/*

RUN ln -s /mnt/vol/testuser/lus /home/${D_USERNAME}/lus 
RUN ln -s /mnt/vol/testuser/.learnUnix /home/${D_USERNAME}/.learnUnix

RUN addgroup -g $D_GID lus
RUN addgroup ${D_USERNAME} lus

USER ${D_USERNAME}
WORKDIR /home/${D_USERNAME}

RUN echo "export PATH=$PATH:/home/${D_USERNAME}/bin" >> /home/${D_USERNAME}/.bashrc

CMD ["/bin/bash"]
