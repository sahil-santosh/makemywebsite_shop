import 'package:flutter/material.dart';
import 'package:makemywebsite_shop/provider/product.dart';
import 'package:makemywebsite_shop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);            
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              product.toggleFavoriteStatus();           
            },
            color: Theme.of(context).accentColor,
          ),
          title: Text(product.title, textAlign: TextAlign.center),
          trailing: Consumer<Product>(
            builder: (context, value, _) => IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
