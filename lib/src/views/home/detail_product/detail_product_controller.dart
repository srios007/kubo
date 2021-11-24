import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class DetailproductController extends ControllerMVC {
  factory DetailproductController() {
    _this = DetailproductController._();
    return _this;
  }
  static DetailproductController _this;

  DetailproductController._();

  static DetailproductController get con => _this;

  String pageName = 'Detailproduct';

  String formatCurrncy(int number) {
    return '${NumberFormat.simpleCurrency().format(number).replaceAll('.00', '').replaceAll(',', '.')} COP';
  }
}
