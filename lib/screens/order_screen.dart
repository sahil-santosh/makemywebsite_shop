import 'package:flutter/material.dart';
import 'package:makemywebsite_shop/provider/orders.dart';
import 'package:makemywebsite_shop/widgets/app_drawer.dart';
import 'package:makemywebsite_shop/widgets/order_item_aa.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index) => OrderItemAA(orderData.orders[index]),
      ),
    );
  }
}