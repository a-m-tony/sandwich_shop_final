
enum SandwichType {
  veggieDelight('Veggie Delight'),
  tunaMelt('Tuna Melt'),
  chickenTeriyaki('Chicken Teriyaki');

  const SandwichType(this.name);
  final String name;
}

enum BreadType {
  white('White'),
  wheat('Wheat');

  const BreadType(this.name);
  final String name;
}

enum SandwichSize {
  sixInch('6-inch'),
  footlong('Footlong');

  const SandwichSize(this.name);
  final String name;
}

class Sandwich {
  final SandwichType type;
  final SandwichSize size;
  final BreadType breadType;

  Sandwich({
    required this.type,
    required this.size,
    required this.breadType,
  });

  String get name => type.name;

  String get image {
    String imageName;
    switch (type) {
      case SandwichType.veggieDelight:
        imageName = size == SandwichSize.footlong ? 'veggieDelight_footlong.png' : 'veggieDelight_sixinch.png';
        break;
      case SandwichType.tunaMelt:
        // Fallback to veggie delight images as tuna melt images are not available
        imageName = size == SandwichSize.footlong ? 'veggieDelight_footlong.png' : 'veggieDelight_sixinch.png';
        break;
      case SandwichType.chickenTeriyaki:
        // Only footlong image is available for chicken sandwich.
        imageName = size == SandwichSize.footlong ? 'veggieDelight_footlong.png' : 'veggieDelight_sixinch.png';
        break;
    }
    return 'assets/image/$imageName';
  }

  // Override `==` and `hashCode` to allow for proper object comparison in the cart.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Sandwich &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          size == other.size &&
          breadType == other.breadType;

  @override
  int get hashCode => type.hashCode ^ size.hashCode ^ breadType.hashCode;
}
