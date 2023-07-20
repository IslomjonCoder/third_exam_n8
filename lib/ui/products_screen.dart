import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:third_exam_n8/utils/path.dart';

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
            return Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.white,
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.6,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        color: Colors.green,
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 20,
                        width: 120,
                        color: Colors.green,
                      ),
                    ],
                  );
                },
              ),
            );
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
