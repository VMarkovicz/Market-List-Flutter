import 'package:flutter/material.dart';
import 'package:shopping_list/repositories/products_repository.dart';

class ProductsView extends StatelessWidget {
    const ProductsView({super.key});
    
    @override
    Widget build(BuildContext context) {
        final products = ProductsRepositoryMemory().productsList;
        return Scaffold(
            appBar: AppBar(
                leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        child: Image.asset('assets/profile.jpg'),
                    ),
                ),
                title: const Text('Market'),
                centerTitle: true,
                actions: [
                    Badge.count(
                        count: 2,
                        offset: Offset(-5, 5),
                        backgroundColor: Colors.tealAccent,
                        child:  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.shopping_cart),
                                ),
                    )
                ],
            ),
            body: ListView.separated(
                    itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(products[index].name),
                            trailing: Switch(
                                    value: true, 
                                    onChanged: (value) {}),
                        );
                    },
                    separatorBuilder: (_,_) => Divider(), 
                    itemCount: products.length),
            floatingActionButton: FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.add_shopping_cart),
                ),
        );
    }
}