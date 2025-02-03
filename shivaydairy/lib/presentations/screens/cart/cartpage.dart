import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shivaydairy/cartprovider.dart';
import 'home.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  final int _selectedindex = 3;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

@override
Widget build(BuildContext context) {
  final cartProvider = Provider.of<CartProvider>(context);

  return Scaffold(
    appBar: AppBar(
      title: const Text('My Cart'),
    ),
    body: cartProvider.items.isEmpty
        ? const Center(
            child: Text('Your cart is empty!'),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.items.length,
                  itemBuilder: (ctx, i) {
                    final item = cartProvider.items.values.toList()[i];
                    return ListTile(
                      leading:
                          Image.network(item.imageUrl, width: 50, height: 50),
                      title: Text(item.name),
                      subtitle: Text('₹${item.price.toStringAsFixed(2)}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              if (item.quantity > 1) {
                                cartProvider.updateQuantity(
                                    item.id, item.quantity - 1);
                              } else {
                                cartProvider.removeItem(item.id);
                              }
                            },
                          ),
                          Text(item.quantity.toString()),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              cartProvider.addItem(item.id, item.name,
                                  item.price, item.imageUrl);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '₹${cartProvider.totalAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle checkout logic
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                            double.infinity, 50), // Full-width button
                      ),
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          ),
  );
}
