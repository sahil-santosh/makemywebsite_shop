import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:makemywebsite_shop/provider/orders.dart';

class OrderItemAA extends StatefulWidget {
  final OrderItem order;

  OrderItemAA(this.order);

  @override
  _OrderItemAAState createState() => _OrderItemAAState();
}

class _OrderItemAAState extends State<OrderItemAA> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\Rs. ${widget.order.amount}'),
            subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if(_expanded) Container(
            height: min(widget.order.products.length * 20.0 + 100, 180),
            child: ListView(
              children: widget.order.products.map((prod) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(prod.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Text('${prod.quantity}x \Rs ${prod.price}',style: TextStyle(fontSize: 18),),
                ],
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}
