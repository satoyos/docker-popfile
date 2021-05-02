FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
#日本語化パッケージリストをインストール
RUN apt-get install -y language-pack-ja-base language-pack-ja locales
#localeを日本語設定に変更
RUN locale-gen ja_JP.UTF-8
#言語を日本語に設定
ENV LANG ja_JP.UTF-8
RUN apt-get install -y popfile