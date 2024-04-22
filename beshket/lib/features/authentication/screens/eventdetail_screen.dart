//<Martin Podmanicky>
import 'package:flutter/material.dart';
import 'package:beshket/models/event.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: SingleChildScrollView(
        // For scrollable content
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display event details (image, name, location, date, price, description, etc.)
              Image.network(
                event.imagePath,
                width: double.infinity, // Adjust width as needed
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10.0),
              Text(
                event.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text('${event.date} - ${event.location}'),
              Text(event.price),
              // ... other event details
            ],
          ),
        ),
      ),
    );
  }
}
