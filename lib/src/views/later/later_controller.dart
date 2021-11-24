import 'package:mvc_pattern/mvc_pattern.dart';

class LaterController extends ControllerMVC {
  factory LaterController() {
    _this = LaterController._();
    return _this;
  }
  static LaterController _this;

  LaterController._();

  static LaterController get con => _this;

  String pageName = 'Later';
}
