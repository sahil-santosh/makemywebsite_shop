import 'package:flutter/material.dart';
import 'package:makemywebsite_shop/provider/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(context,listen: false,).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(loadedProduct.imageUrl,fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            Text('\Rs. ${loadedProduct.price}',style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(loadedProduct.desc,textAlign: TextAlign.center,softWrap: true),
            ),
          ],
        ),
      ),
    );
  }
}
