import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/models/sandwich.dart';

void main() {
  test('Sandwich can be created', () {
    final sandwich = Sandwich(
      bread: 'Wheat',
      ingredients: ['Lettuce', 'Tomato'],
      sauce: 'Mayonnaise',
    );

    expect(sandwich.bread, 'Wheat');
    expect(sandwich.ingredients, ['Lettuce', 'Tomato']);
    expect(sandwich.sauce, 'Mayonnaise');
  });
}
