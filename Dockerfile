FROM alpine

WORKDIR /root

RUN apk --update add \
    bash \
    vim \
    git \
    nodejs \
    npm \
    curl

RUN apk --update add \
    build-base automake autoconf curl-dev 

RUN git clone -b release https://github.com/roswell/roswell.git
WORKDIR roswell
RUN bash ./bootstrap
RUN bash ./configure && make && make install

RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY ./vimrc /root/.vimrc
RUN vim -c PlugInstall -c q -c q

ENV USER root

