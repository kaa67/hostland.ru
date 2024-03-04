[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

# hostland.ru - ЭМУЛЯТОР

Симулятор платформы хостинга https://hostland.ru
- Apache v2
- php v8.2

С повторением доменной файловой структуры хостинга

## Для запуска демо

Для запуска демо
- Склонируйте себе
```sh
  git clone https://github.com/kaa67/hostland.ru
```
- Скопируйте/переименуйте папку sitename.demo в sitename
```sh
  cp -r sitename.demo sitename
```
или
```sh
  mv sitename.demo sitename
```
- Запустите композитор
```sh
  docker compose up
```
или
```sh
  docker-compose up
```
- Откройте в браузере страницу [localhost](http://localhost)

## Если чуть-чуть не устраивает

Если чуть-чуть не устраивает и знаете, что вам нужно/не нужно -
возьмите dockerhub/Dockerfile, настройте и используйте 
вместо готового образа из хаба
