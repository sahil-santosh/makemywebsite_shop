import 'package:flutter/material.dart';
import 'package:makemywebsite_shop/provider/cart.dart';
import 'package:makemywebsite_shop/widgets/badge.dart';
import 'package:makemywebsite_shop/widgets/product_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
                  PopupMenuItem(
                    child: Text('Only Favorites'),
                    value: FilterOptions.Favorites,
                  ),
                  PopupMenuItem(
                    child: Text('Show All'),
                    value: FilterOptions.All,
                  ),
                ],
          ),
          Consumer<Cart>(builder: (_, cart, ch) =>
          Badge(
            child: IconButton(
              icon: Icon(Icons.shopping_cart), onPressed: (){}), 
            value: cart.itemCount.toString(),
            ),)
          
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
