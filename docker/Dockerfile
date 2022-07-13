FROM alpine
RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk add bash-doc
RUN apk add bash-completion
RUN apk add grep
RUN apk add coreutils
RUN apk add less

RUN echo 'export PS1="\033[38;5;075;48;5;000m\u@docker\[\033[00m\]:\033[38;5;082;48;5;000m\w\[\033[00m\]\$ "' >> /etc/profile.d/PS1.sh

RUN adduser -S testuser

ADD bin /home/testuser/bin
RUN chown -R testuser /home/testuser/bin
RUN chmod u+x /home/testuser/bin/*

USER testuser
WORKDIR /home/testuser

RUN echo 'export PATH=$PATH:/home/testuser/bin' >> /home/testuser/.bashrc

CMD ["/bin/bash"]
