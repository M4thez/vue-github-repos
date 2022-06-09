# vue-github-repos

## Założenia i ograniczenia

- Użyłem frameworka Vue do wykonania tego zadania oraz Vue CLI do jego konfiguracji 
- Aplikacja pozwala wyszukać jedynie jednego konkretnego użytkownika GitHub naraz
- Aplikacja wyświetla języki użyte w danym repozytorium tylko dla jednego repozytorium w danym momencie
- Aplikacja nie wyświetla ładowania danych (dane ładują się raczej szybko)
- Aplikacja wyświetla jedynie publiczne repozytoria danego użytkownika
- Zapytania do GitHubowego API są wysyłane w trybie nieautoryzowanym przez co limit zapytań jest ściślejszy, aplikacja nie sprawdza czy przekroczono limit zapytań
- Całość aplikacji jest w języku angielskim, języka polskiego użyłem tylko w tym fragmencie README

## Availability

Live site is available at: 

https://m4thez.github.io/vue-github-repos/

## Project setup

```
npm install
```

### Compiles and hot-reloads for development

```
npm run serve
```

### Compiles and minifies for production

```
npm run build
```

