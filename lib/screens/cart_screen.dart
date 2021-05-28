import 'package:flutter/material.dart';
import 'package:makemywebsite_shop/provider/cart.dart';
import 'package:makemywebsite_shop/provider/orders.dart';
import 'package:makemywebsite_shop/screens/order_screen.dart';
import 'package:makemywebsite_shop/widgets/app_drawer.dart';
import 'package:makemywebsite_shop/widgets/cart_item_aa.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyle(fontSize: 20)),
                  // SizedBox(width: 10),
                  Chip(
                    label: Text('\Rs ${cart.totalAmount.toStringAsFixed(2)}'),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    child: Text("Order Now",style: TextStyle(fontWeight: FontWeight.bold),),
                    style: TextButton.styleFrom(primary: Colors.blue),
                    onPressed: () {//day13
                      Provider.of<Order>(context,listen: false).addOrder(cart.items.values.toList(), cart.totalAmount,);
                      cart.clear();
                      Navigator.of(context).pushNamed(OrderScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) => CartItemAA(
                cart.items.values.toList()[index].id,
                cart.items.values.toList()[index].price,
                cart.items.values.toList()[index].quantity,
                cart.items.values.toList()[index].title,
                cart.items.keys.toList()[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
