# Bitcoin Demo

![Image alt text](assets/images/bitcoin.png)


In this project I have followed MVVM pattern for our flutter development. Flutter is providing different state management techniques but in this code we are using riverpod for managing the state.

I have made speperate the business logic from UI. so I have put UI in widgets in the UI folder and Other services, providers and repositories etc in the infrastructure folder.

Infrastructure folder contains models, services, repositories, theme_helper, navigation router etc.

## 1) Commons :-
In the commons we are declaring constants, enums, extensions, utils etc.

## 2) Data Access Layer:-
In this layer we are doing network operation. For calling an API from provider (Viewmodels).

## 3) Models:-
In this layer we are creatng data models.

## 4) Providers:-
In this layer we are creatng providers which is work as viewmodels and containing the business logic.

## 5) Services:-
In this layer we are creatng third party services like shared prefrences etc.

## 6) UI Layer:-

  Screens:-




