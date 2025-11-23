import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/repository/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    test('should return the correct price for a six-inch sandwich', () {
      final pricingRepository = PricingRepository();
      final price = pricingRepository.calculatePrice(quantity: 1, isFootlong: false);
      expect(price, 7.0);
    });

    test('should return the correct price for a footlong sandwich', () {
      final pricingRepository = PricingRepository();
      final price = pricingRepository.calculatePrice(quantity: 1, isFootlong: true);
      expect(price, 11.0);
    });

    test('should return the correct price for multiple six-inch sandwiches', () {
      final pricingRepository = PricingRepository();
      final price = pricingRepository.calculatePrice(quantity: 2, isFootlong: false);
      expect(price, 14.0);
    });

    test('should return the correct price for multiple footlong sandwiches', () {
      final pricingRepository = PricingRepository();
      final price = pricingRepository.calculatePrice(quantity: 2, isFootlong: true);
      expect(price, 22.0);
    });
  });
}
