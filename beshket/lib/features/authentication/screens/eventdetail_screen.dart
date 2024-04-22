//<Martin Podmanicky>
import 'package:beshket/features/authentication/widgets/custom_signin_button.dart';
import 'package:beshket/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:beshket/models/event.dart';
import 'package:provider/provider.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        // For scrollable content
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display event details (image, name, location, date, price, description, etc.)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  event.imagePath,
                  width: double.infinity, // Adjust width as needed
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                event.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text('${event.date} - ${event.location}'),
              Text(
                'Price: ${event.price}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Description',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(event.description),
              SizedBox(height: 10.0),
              // ... other event details
              MyButton(
                hintText: 'Add to cart',
                onTap: () {
                  print('Adding to cart ${event.name}');
                  Provider.of<CartProvider>(context, listen: false)
                      .addToCart(event);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
