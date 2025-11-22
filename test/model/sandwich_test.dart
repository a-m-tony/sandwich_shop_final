import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/model/sandwich.dart';

void main() {
  group('Sandwich', () {
    test('Sandwich image path for six-inch sandwich', () {
      final sandwich = Sandwich(
          type: SandwichType.tunaMelt, size: SandwichSize.sixInch, breadType: BreadType.white);
      expect(sandwich.image, 'assets/image/veggieDelight_sixinch.png');
    });

    test('Sandwich image path for footlong sandwich', () {
      final sandwich = Sandwich(
          type: SandwichType.tunaMelt, size: SandwichSize.footlong, breadType: BreadType.white);
      expect(sandwich.image, 'assets/image/veggieDelight_footlong.png');
    });

    test('Sandwich image path for another six-inch sandwich type', () {
      final sandwich = Sandwich(
          type: SandwichType.chickenTeriyaki,
          size: SandwichSize.sixInch,
          breadType: BreadType.white);
      expect(sandwich.image, 'assets/image/chicken_footlong.png');
    });

    test('Sandwich image path for another footlong sandwich type', () {
      final sandwich = Sandwich(
          type: SandwichType.veggieDelight,
          size: SandwichSize.footlong,
          breadType: BreadType.white);
      expect(sandwich.image, 'assets/image/veggieDelight_footlong.png');
    });
  });
}
