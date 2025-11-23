
import 'package:flutter/material.dart';
import 'package:myapp/model/cart.dart';
import 'package:myapp/repository/pricing_repository.dart';
import 'package:myapp/views/checkout_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _navigateToCheckout() {
    final cart = Provider.of<Cart>(context, listen: false);
    if (cart.sandwiches.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your cart is empty'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CheckoutScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          if (cart.sandwiches.isEmpty) {
            return const Center(
              child: Text('Your cart is empty.'),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.sandwiches.length,
                  itemBuilder: (context, index) {
                    final sandwich = cart.sandwiches.keys.elementAt(index);
                    final quantity = cart.sandwiches[sandwich]!;
                    final price = PricingRepository().getPrice(sandwich) * quantity;

                    return ListTile(
                      title: Text(sandwich.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Size: ${sandwich.size.toString().split('.').last}'),
                          Text(
                              'Bread: ${sandwich.breadType.toString().split('.').last}'),
                          Text('Quantity: $quantity'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${price.toStringAsFixed(2)}'),
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              cart.removeSandwich(sandwich);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '\$${cart.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _navigateToCheckout,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Checkout'),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
