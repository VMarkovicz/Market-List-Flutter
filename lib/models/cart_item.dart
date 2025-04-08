import 'package:shopping_list/models/product.dart';

class CartItem {
    final Product product;
    int quantity;
    bool isSelected;

    CartItem(this.product, this.quantity, this.isSelected);
}