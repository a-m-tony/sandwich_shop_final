import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/repository/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    late PricingRepository pricingRepository;

    setUp(() {
      pricingRepository = PricingRepository();
    });

    test('calculates price for six-inch sandwiches', () {
      expect(pricingRepository.calculatePrice(quantity: 1, isFootlong: false), 7.0);
      expect(pricingRepository.calculatePrice(quantity: 2, isFootlong: false), 14.0);
    });

    test('calculates price for footlong sandwiches', () {
      expect(pricingRepository.calculatePrice(quantity: 1, isFootlong: true), 11.0);
      expect(pricingRepository.calculatePrice(quantity: 2, isFootlong: true), 22.0);
    });

    test('calculates price for zero quantity', () {
      expect(pricingRepository.calculatePrice(quantity: 0, isFootlong: false), 0.0);
      expect(pricingRepository.calculatePrice(quantity: 0, isFootlong: true), 0.0);
    });

    test('throws an error for negative quantity', () {
      expect(() => pricingRepository.calculatePrice(quantity: -1, isFootlong: false), throwsA(isA<ArgumentError>()));
    });
  });
}
