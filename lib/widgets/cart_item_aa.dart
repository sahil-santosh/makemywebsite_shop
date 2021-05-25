import 'package:flutter/material.dart';

class CartItemAA extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItemAA(
    this.id,
    this.price,
    this.quantity,
    this.title,
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(child: Text('\Rs $price',style: TextStyle(),)),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \Rs ${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
