import 'package:aula_estado/model/product_model.dart';
import 'package:aula_estado/widgets/no_product.dart';
import 'package:aula_estado/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatefulWidget {
  final List<Product> productData;
  final ScrollController controller;

  const ProductGridView({
    super.key,
    required this.productData,
    required this.controller,
  });

  @override
  State<ProductGridView> createState() => ProductGridViewState();
}

class ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    if (widget.productData.isEmpty) {
      return const NoAvailableProducts();
    }

    return Expanded(
      flex: 4,
      child: GridView.builder(
        controller: widget.controller,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 5,
          childAspectRatio: 2 / 3.25,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: widget.productData.length,
        itemBuilder: (context, index) {
          return ProductItem(product: widget.productData[index]);
        },
      ),
    );
  }
}
