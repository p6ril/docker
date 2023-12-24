FROM alpine:edge

ARG USER_ID
ARG USER_NAME
ARG GROUP_ID

# the -D flag in the adduser command is equivalent to --disabled-password
# https://wiki.alpinelinux.org/wiki/Setting_up_a_new_user#Options

RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash vim curl bat git build-base python3 nodejs npm && \
    addgroup -g $GROUP_ID $USER_NAME && \
    adduser -D -u $USER_ID -G $USER_NAME $USER_NAME -s /bin/bash && \
    mkdir /home/$USER_NAME/dev && \
    mkdir -p /home/$USER_NAME/.vim/plugin && \
    chown -R $USER_NAME:$USER_NAME /home/$USER_NAME && \
    npm install -g npm@latest

ADD --chown=$USER_NAME:$USER_NAME ./assets/vimrc /home/$USER_NAME/.vim
ADD --chown=$USER_NAME:$USER_NAME ./assets/auto-pairs.vim /home/$USER_NAME/.vim/plugin
ADD --chown=$USER_NAME:$USER_NAME ./assets/bashrc /home/$USER_NAME/.bashrc

WORKDIR /home/$USER_NAME/dev

USER $USER_NAME

EXPOSE 3001

CMD ["bash"]
