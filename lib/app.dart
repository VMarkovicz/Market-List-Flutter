import 'package:flutter/material.dart';
import 'package:shopping_list/products/products_view.dart';

class App extends StatelessWidget{
    const App({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.teal,
                ),
            ),
            home: ProductsView(),
            debugShowCheckedModeBanner: false,
        );
    }
}