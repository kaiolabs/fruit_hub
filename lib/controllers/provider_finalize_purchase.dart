import 'package:flutter/cupertino.dart';

class ProviderfinalizePurchase extends ChangeNotifier {
  int _counter = 1;
  int _price = 0;
  int _totalPrice = 0;

  int get counter => _counter;

  int get price => _price;

  int get totalPrice => _totalPrice;

  init(value) {
    _price = value;
    _totalPrice = value;
    notifyListeners();
  }

  void increment() {
    _counter++;
    _totalPrice = _price * _counter;
    notifyListeners();
  }

  void decrement() {
    if (_counter > 1) {
      _counter--;
      _totalPrice = _totalPrice - _price;
      notifyListeners();
    }
  }

  void setPrice(int price) {
    _price = price;
    notifyListeners();
  }

  void resetAll() {
    _counter = 1;
    _price = 0;
    notifyListeners();
  }
}
