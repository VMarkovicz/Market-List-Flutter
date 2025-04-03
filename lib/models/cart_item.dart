import 'package:shopping_list/models/product.dart';

class CartItem {
    final Product product;
    final int quantity;
    final bool isSelected;

    CartItem(this.product, this.quantity, this.isSelected);
}