
import 'package:flutter/material.dart';
import 'package:myapp/model/cart.dart';
import 'package:myapp/views/cart_screen.dart';
import 'package:provider/provider.dart';
import 'package:myapp/model/sandwich.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<Sandwich> _sandwiches = [
    Sandwich(
        type: SandwichType.veggieDelight,
        size: SandwichSize.sixInch,
        breadType: BreadType.wheat),
    Sandwich(
        type: SandwichType.veggieDelight,
        size: SandwichSize.footlong,
        breadType: BreadType.wheat),
    Sandwich(
        type: SandwichType.tunaMelt, 
        size: SandwichSize.footlong, 
        breadType: BreadType.white
    ),
  ];

  void _addSandwichToCart(Sandwich sandwich) {
    String message = 'Sandwich added to cart.';
    String title = 'Success!';
    try {
      Provider.of<Cart>(context, listen: false).addSandwich(sandwich);
    } catch (e) {
      message = 'Error adding sandwich: ${e.toString()}';
      title = 'Error';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandwich Shop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _sandwiches.length,
        itemBuilder: (context, index) {
          final sandwich = _sandwiches[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    sandwich.image,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    sandwich.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    sandwich.size.name,
                  ),
                  ElevatedButton(
                    onPressed: () => _addSandwichToCart(sandwich),
                    child: const Text('Add to Cart'),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
