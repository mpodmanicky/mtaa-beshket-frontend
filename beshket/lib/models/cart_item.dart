import 'package:beshket/models/event.dart';

class CartItem {
  final Event event;
  final int quantity;

  CartItem(this.event, this.quantity);

  Event get getEvent => event;
  int get getQuantity => quantity;
  set setQuantity(int quantity) => quantity;
}
