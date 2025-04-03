import 'dart:collection';

import 'package:shopping_list/models/cart_item.dart';
import 'package:shopping_list/models/product.dart';

abstract class ProductsRepository {}

class ProductsRepositoryMemory extends ProductsRepository{
    static final List<CartItem> _cartItems = [];
    static final List<Product> _productsList = [
        Product('1', 'Apples'),
        Product('2', 'Bananas'),
        Product('3', 'Oranges'),
        Product('4', 'Grapes'),
        Product('5', 'Pineapples'),
        Product('6', 'Mangoes'),
        Product('7', 'Strawberries'),
        Product('8', 'Blueberries'),
        Product('9', 'Watermelons'),
        Product('10', 'Peaches'),
    ];

    List<Product> get productsList => UnmodifiableListView(_productsList);
    List<CartItem> get cartItems => UnmodifiableListView(_cartItems);
}