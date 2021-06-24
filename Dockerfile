FROM alpine

WORKDIR /root

RUN apk --update add \
    bash \
    vim \
    git \
    nodejs \
    npm \
    curl

RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY ./vimrc /root/.vimrc
RUN vim -c PlugInstall -c q -c q

ENV USER root

