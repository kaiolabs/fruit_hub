import 'package:flutter/cupertino.dart';

class ProviderfinalizePurchase extends ChangeNotifier {
  int _counter = 1;
  int _pricePlate = 0;
  int _totalPricePlate = 0;
  int _totalPriceBasket = 0;
  final List<Map> _orderListbasket = [];

  int get counter => _counter;

  int get pricePlate => _pricePlate;

  int get totalPrice => _totalPricePlate;

  List<Map> get orderListbasket => _orderListbasket;

  int get totalPriceBasket => _totalPriceBasket;

  init(value) {
    _pricePlate = value;
    _totalPricePlate = value;
    notifyListeners();
  }

  void increment() {
    _counter++;
    _totalPricePlate = _pricePlate * _counter;
    notifyListeners();
  }

  void decrement() {
    if (_counter > 1) {
      _counter--;
      _totalPricePlate = _totalPricePlate - _pricePlate;
      notifyListeners();
    }
  }

  void setPrice(int price) {
    _pricePlate = price;
    notifyListeners();
  }

  void resetAll() {
    _counter = 1;
    _pricePlate = 0;
    notifyListeners();
  }

  void addOrderList(Map order) {
    _orderListbasket.add(order);
    notifyListeners();
  }

  void removeOrderList(int index) {
    _orderListbasket.removeAt(index);
    notifyListeners();
  }

  void resetOrderList() {
    _orderListbasket.clear();
    notifyListeners();
  }

  void setTotal(int value) {
    _totalPricePlate = value;
    notifyListeners();
  }

  void totalPurchaseAmount() {
    _totalPriceBasket = 0;
    for (var i = 0; i < _orderListbasket.length; i++) {
      _totalPriceBasket += _orderListbasket[i]['price'] as int;
    }
    notifyListeners();
  }

  void clearList() {
    _orderListbasket.clear();
    notifyListeners();
  }
}
