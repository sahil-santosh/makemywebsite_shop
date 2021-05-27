import 'package:flutter/material.dart';
import 'package:makemywebsite_shop/provider/cart.dart';
import 'package:provider/provider.dart';

class CartItemAA extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String productId;

  CartItemAA(
    this.id,
    this.price,
    this.quantity,
    this.title,
    this.productId,
  );
  @override
  Widget build(BuildContext context) {
    //in day 10 rape card widget into dismissible widget and set value key by id
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 2),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(
                    child: Text(
                  '\Rs $price',
                  style: TextStyle(),
                )),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \Rs ${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
