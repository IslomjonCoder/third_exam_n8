import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:third_exam_n8/ui/shimmers/product_shimmer.dart';

import 'package:third_exam_n8/utils/path.dart';
import 'package:third_exam_n8/widgets/shimmer_skeleton.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);
  ApiProvider provider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder(
        future: provider.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ProductShimmer();
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            final products = snapshot.data!;

            return (products.statusCode == 200)
                ? ProductsListView(
                    products: products.data,
                  )
                : Center(
                    child: Text(
                      "Status code : ${products.statusCode}Error: ${products.error}",
                    ),
                  );
          }
          return Center(child: Text(snapshot.data.toString()));
        },
      ),
    );
  }
}
