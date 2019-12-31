# tight

A different way to manage application state outside of the UI.
This package uses the provider package under the hood but abstracts
the implementation so that the application logic can be tested completely
outside of the UI code.


```Dart
class MyLogic extends TightController<MyLogic>{

    //implement logic here
    int count = 0;
    add(){
        count++;
        notifyListeners();
    }
}
```



You are able to do whatever you need to get data. This is then updated inside which ever
class that decides to use this controller.

This follows some of the same convention as using a TextEditingController.

You update the controller and the class using it will automatically update itself.


## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
