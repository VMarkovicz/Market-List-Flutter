import 'dart:collection';

import 'package:shopping_list/models/cart_item.dart';
import 'package:shopping_list/models/product.dart';

abstract class ProductsRepository {
    static final List<CartItem> _cartItems = [];
    static final List<Product> _productsList = [];
    List<Product> get productsList => UnmodifiableListView(_productsList);
    List<CartItem> get cartItems => UnmodifiableListView(_cartItems);

    void addProduct (String name);
    void toggleCartItem (Product product);
    String productsText ();
}

class ProductsRepositoryMemory extends ProductsRepository{
    static final List<CartItem> _cartItems = [
        CartItem(Product('1', 'Apples'), 1, false)
    ];
    static final List<Product> _productsList = [
        Product('1', 'Apples')
    ];

    List<Product> get productsList => UnmodifiableListView(_productsList);
    List<CartItem> get cartItems => UnmodifiableListView(_cartItems);

    @override
    void addProduct (String name) {
        final product = Product(DateTime.now().toString(), name);
        _productsList.add(product);
    }
    
    @override
    void toggleCartItem(Product product) {
        int index = _cartItems.indexWhere((item) => item.product.id == product.id);
        if (index >= 0) {
            _cartItems.removeAt(index);
            return;
        } 
        _cartItems.add(CartItem(product, 1, false));
    }
    
    @override
    String productsText() {
        return _productsList.map((product) => product.name).join(', ');
    }
}