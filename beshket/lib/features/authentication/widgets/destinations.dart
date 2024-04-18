import 'package:flutter/material.dart';

class Destination {
  const Destination(this.icon, this.label);
  final IconData icon;
  final String label;
}

const List<Destination> destinations = <Destination>[
  Destination(Icons.home_rounded, 'Home'),
  Destination(Icons.storage_rounded, 'Tickets'),
  Destination(Icons.message_rounded, 'Messages'),
  Destination(Icons.shopping_basket_rounded, 'Cart'),
];
