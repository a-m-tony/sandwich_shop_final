import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/model/cart.dart';
import 'package:myapp/repository/pricing_repository.dart';
import 'package:myapp/model/sandwich.dart';
import 'package:mockito/mockito.dart';

class MockPricingRepository extends Mock implements PricingRepository {}

void main() {
  group('Cart', () {
    test('should be able to add a sandwich', () {
      final pricingRepository = MockPricingRepository();
      final cart = Cart(pricingRepository);
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        size: SandwichSize.footlong,
        breadType: BreadType.white,
      );

      cart.addSandwich(sandwich);

      expect(cart.sandwiches.length, 1);
      expect(cart.sandwiches.containsKey(sandwich), isTrue);
    });

    test('should be able to remove a sandwich', () {
      final pricingRepository = MockPricingRepository();
      final cart = Cart(pricingRepository);
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        size: SandwichSize.footlong,
        breadType: BreadType.white,
      );

      cart.addSandwich(sandwich);
      cart.removeSandwich(sandwich);

      expect(cart.sandwiches.length, 0);
    });

    test('should calculate the total price', () {
      final pricingRepository = MockPricingRepository();
      final cart = Cart(pricingRepository);
      final sandwich1 = Sandwich(
        type: SandwichType.veggieDelight,
        size: SandwichSize.footlong,
        breadType: BreadType.white,
      );
      final sandwich2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        size: SandwichSize.sixInch,
        breadType: BreadType.wheat,
      );

      when(pricingRepository.getPrice(sandwich1)).thenReturn(5.50);
      when(pricingRepository.getPrice(sandwich2)).thenReturn(7.00);

      cart.addSandwich(sandwich1);
      cart.addSandwich(sandwich2);

      expect(cart.totalPrice, 12.50);
    });
  });
}
