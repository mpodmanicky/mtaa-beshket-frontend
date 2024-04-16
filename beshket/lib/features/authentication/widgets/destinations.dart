import 'package:flutter/material.dart';

class Destination {
  const Destination(this.icon, this.label);
  final IconData icon;
  final String label;
}

const List<Destination> destinations = <Destination>[
  Destination(Icons.shopping_basket_rounded, 'Cart'),
  Destination(Icons.home, 'Home'),
  Destination(Icons.storage_rounded, 'Tickets'),
  Destination(Icons.message_rounded, 'Messages'),
];
