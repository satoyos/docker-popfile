# DockerでPOPFileを動作させる

Dockerコンテナでメールフィルタ[POPFile](https://getpopfile.org/docs/jp)を動かすための設定ファイル群です。

> This document is written in Japanese because it is assumed that this repository will run POPFile in the Japanese environment of Ubuntu.

このドキュメントを日本語で書いているのは、このリポジトリがPOPFileをUbuntuの日本語環境で動かすことが前提になっているからです。

## 1. 前提

- ベースOS: Ubuntu:latest
- 言語: 日本語(UTF-8)
- POPFileのポート: 8080 (デフォルトのまま)

## 2. 準備

このフォルダの直下に`popfile_data`というフォルダを用意します。このフォルダはコンテナからマウントされ、POPFileの設定データや学習データが書き込まれます。

既に設定ファイルや学習データがあり、最初からそれらを使いたい場合には、`popfile_data`フォルダの下に予めコピーしておきます。

次のような配置になります。

```sh
$ tree -L 2
.
├── Dockerfile
├── Gemfile
├── Gemfile.lock
├── docker-compose.yml
├── popfile_data
│   ├── popfile.cfg  # POPFileの設定ファイル
│   ├── popfile.db   # POPFileの学習ファイル
│   └── stopwords    # コンテナ起動後に自動作成されるファイル
├── spec
│   ├── popfile_spec.rb
│   ├── spec_helper.rb
│   └── time_and_locale_spec.rb
└── vendor
    └── bundle
```

## 3. 起動

このリポジトリをクローンしたフォルダで
```sh
$ docker-compose up
```
すれば、起動します。前提のところで書いたように、ホストOSのポート8080でGUI(HTML)にアクセスできます。

## 4. おまけ：テストについて

このリポジトリにはrubyに関わるファイルやフォルダが含まれています。

これらは、環境の開発時にServerspecでテストするために用意したものです。なので、POPFileを動かすだけならこれらのファイルは不要ですし、rubyを導入する必要もありません。

テストは、次の手順で動きます。(rubyのbundlerが動作する前提)
```sh
$ bundle install
$ bundle exec rspec
```