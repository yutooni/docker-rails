# README

## ビルド
docker-compose build

## サーバーの立ち上げ方法
docker-compose up (rails server の代わり)

## Gemfileを変更した時
docker-compose exec web rails bundle install

## コマンド操作方法
docker-compose run web rails ~~
