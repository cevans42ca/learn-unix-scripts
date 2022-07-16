FROM alpine

ARG D_GID=10000
ARG D_USERNAME=duser1

RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk add bash-doc
RUN apk add bash-completion
RUN apk add grep
RUN apk add coreutils
RUN apk add less

RUN echo 'export PS1="\033[38;5;075;48;5;000m\u@docker\[\033[00m\]:\033[38;5;082;48;5;000m\w\[\033[00m\]\$ "' >> /etc/profile.d/PS1.sh

RUN adduser -S $D_USERNAME

ADD bin /home/${D_USERNAME}/bin
RUN chown -R ${D_USERNAME} /home/${D_USERNAME}/bin
RUN chmod u+x /home/${D_USERNAME}/bin/*

RUN ln -s /mnt/lus /home/${D_USERNAME}/lus 

RUN addgroup -g $D_GID lus
RUN addgroup ${D_USERNAME} lus

USER ${D_USERNAME}
WORKDIR /home/${D_USERNAME}

RUN echo "export PATH=$PATH:/home/${D_USERNAME}/bin" >> /home/${D_USERNAME}/.bashrc

CMD ["/bin/bash"]
