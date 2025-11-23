import 'package:flutter/foundation.dart';
import 'package:myapp/repository/pricing_repository.dart';
import 'package:myapp/model/sandwich.dart';

class Cart extends ChangeNotifier {
  final PricingRepository _pricingRepository;
  final Map<Sandwich, int> _sandwiches = {};

  Cart(this._pricingRepository);

  Map<Sandwich, int> get sandwiches => _sandwiches;

  int get itemCount => _sandwiches.values.fold(0, (sum, quantity) => sum + quantity);

  double get totalPrice {
    return _sandwiches.entries.fold(0.0, (total, entry) {
      final sandwich = entry.key;
      final quantity = entry.value;
      final price = _pricingRepository.getPrice(sandwich);
      return total + (price * quantity);
    });
  }

  void addSandwich(Sandwich sandwich) {
    if (_sandwiches.containsKey(sandwich)) {
      _sandwiches[sandwich] = _sandwiches[sandwich]! + 1;
    } else {
      _sandwiches[sandwich] = 1;
    }
    notifyListeners();
  }

  void removeSandwich(Sandwich sandwich) {
    if (_sandwiches.containsKey(sandwich)) {
      if (_sandwiches[sandwich]! > 1) {
        _sandwiches[sandwich] = _sandwiches[sandwich]! - 1;
      } else {
        _sandwiches.remove(sandwich);
      }
      notifyListeners();
    }
  }
}
