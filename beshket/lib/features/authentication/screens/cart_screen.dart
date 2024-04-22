//<Martin Podmanicky>

import 'package:beshket/features/authentication/widgets/custom_signin_button.dart';
import 'package:beshket/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          'Shopping Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (cartProvider.cartItems.isEmpty)
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      2, // Half the screen height
                  child: Center(
                    child: Text(
                      'Oops! Your cart is empty.',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartProvider.cartItems[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItem.event.name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Quantity: ${cartItem.quantity}'),
                                Text('Price: ${cartItem.event.price}'),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              cartProvider.removeFromCart(cartItem);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              if (cartProvider.cartItems.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: \$ ${cartProvider.getTotalPrice()}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MyButton(
                        hintText: 'Checkout',
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
