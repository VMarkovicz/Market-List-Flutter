import 'package:flutter/material.dart';
import 'package:shopping_list/models/cart_item.dart';
import 'package:shopping_list/repositories/products_repository.dart';

class CartView extends StatefulWidget {
    final ProductsRepositoryMemory productRepository;
    const CartView({super.key, required this.productRepository});

    @override
    State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
    List<CartItem> cart_items = []; 

    void initState() {
        super.initState();
        cart_items = List.from(widget.productRepository.cartItems);
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Cart'),
                centerTitle: true,
            ),
            body: ListView.separated(
                    itemBuilder: (context, index) {
                        return ListTile(
                            leading: Checkbox(
                                    value: cart_items[index].isSelected, 
                                    onChanged: (value) {
                                        setState(() {
                                            cart_items[index].isSelected = value!;
                                        });
                                        cart_items.removeAt(index);
                                    }
                                ),
                            title: Text(cart_items[index].product.name),
                            trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                    IconButton(
                                        onPressed: () {
                                            setState(() {
                                                cart_items[index].quantity--;
                                                if (cart_items[index].quantity <= 0) {
                                                    cart_items.removeAt(index);
                                                }
                                            });
                                        },
                                        icon: const Icon(Icons.remove)
                                    ),
                                    Text(cart_items[index].quantity.toString()),
                                    IconButton(
                                        onPressed: () {
                                            setState(() {
                                                cart_items[index].quantity++;
                                            });
                                        },
                                        icon: const Icon(Icons.add)
                                    ),
                                ],
                            )
                        );
                    }, 
                    separatorBuilder: (_,_) => Divider(), 
                    itemCount: cart_items.length,
                ),
        );
    }
}
