import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:makemywebsite_shop/provider/orders.dart';

class OrderItemAA extends StatelessWidget {
  final OrderItem order;

  OrderItemAA(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\Rs. ${order.amount}'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime)),
            trailing: IconButton(icon: Icon(Icons.expand_more), onPressed: (){}),
          ),
        ],
      ),
    );
  }
}
