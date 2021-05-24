import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makemywebsite_shop/provider/cart.dart';
import 'package:makemywebsite_shop/provider/products.dart';
import 'package:makemywebsite_shop/screens/cart_screen.dart';
import 'package:makemywebsite_shop/screens/product_detail_screen.dart';
import 'package:makemywebsite_shop/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Products(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Cart(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.deepOrange,
            fontFamily: GoogleFonts.lato().fontFamily,
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),    //day9
          },
        ));
  }
}
