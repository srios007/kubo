import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:prueba_kubo/src/views/nav_view.dart';

class WelcomeController extends ControllerMVC {
  factory WelcomeController() {
    _this = WelcomeController._();
    return _this;
  }
  static WelcomeController _this;

  WelcomeController._();

  static WelcomeController get con => _this;

  String pageName = 'Home';

  void toHome(context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => NavView(),
      ),
    );
  }
}
