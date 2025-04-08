import 'package:flutter/material.dart';
import 'package:shopping_list/repositories/products_repository.dart';

class AddProductView extends StatefulWidget {
    final ProductsRepositoryMemory productRepository;
    final Function() onSave;
    const AddProductView({super.key, required this.productRepository, required this.onSave});

    @override
    State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
    final productController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    @override
    void dispose() {
        productController.dispose();
        super.dispose();
    }

    saveProduct() {
        if (formKey.currentState!.validate()) {
            // Save the product to the repository
            widget.productRepository.addProduct(productController.text);
            debugPrint(widget.productRepository.productsText());
            widget.onSave();
            Navigator.of(context).pop();
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: const Text('Add Product'),
            centerTitle: true,
            ),
            body: Form(
                key: formKey,
                child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView(
                    children: [
                        TextFormField(
                            controller: productController,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.shopping_cart),
                                labelText: 'Product Name',
                                hintText: 'Enter product name',
                                border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                    return 'Please enter a product name';
                                }
                                return null;
                            },
                        ),
                        Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: FilledButton(
                                style: FilledButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6.0),
                                    ),
                                ),
                                onPressed: () {
                                    saveProduct();
                                }, 
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Icon(Icons.check),
                                        Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: const Text("Add Product"),
                                        ),
                                    ],
                                )
                            ),
                        ),
                    ],
                ),
                ),
            ),
        );
    }
}