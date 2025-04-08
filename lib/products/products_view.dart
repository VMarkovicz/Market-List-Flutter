import 'package:flutter/material.dart';
import 'package:shopping_list/models/product.dart';
import 'package:shopping_list/products/add_product_view.dart';
import 'package:shopping_list/products/cart_view.dart';
import 'package:shopping_list/repositories/products_repository.dart';

class ProductsView extends StatefulWidget {
    final ProductsRepositoryMemory productRepository;
    const ProductsView({super.key, required this.productRepository});

    @override
    State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
    List<Product> products = [];

    void initState() {
        super.initState();
        final repository = ProductsRepositoryMemory();
        products = repository.productsList;
    }

    void loadProducts() {
        products = widget.productRepository.productsList;
        setState(() {});
    }

    Widget build(BuildContext context) {

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
                        count: widget.productRepository.cartItems.length,
                        offset: Offset(-5, 5),
                        backgroundColor: Colors.tealAccent,
                        child:  IconButton(
                                    onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => CartView(
                                                        productRepository: widget.productRepository,
                                                    ),
                                                fullscreenDialog: true,
                                            ),
                                        );
                                    },
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
                                    value: widget.productRepository.cartItems
                                        .any((item) => item.product.id == products[index].id), 
                                    onChanged: (value) {
                                        setState(() {
                                            widget.productRepository.toggleCartItem(products[index]);
                                        });
                                    }),
                        );
                    },
                    separatorBuilder: (_,_) => Divider(), 
                    itemCount: products.length),
            floatingActionButton: FloatingActionButton(
                    onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => AddProductView(
                                    productRepository: widget.productRepository,
                                    onSave: loadProducts,),
                                fullscreenDialog: true,
                            ),
                        );
                    },
                    child: Icon(Icons.add_shopping_cart),
                ),
        );
    }
}