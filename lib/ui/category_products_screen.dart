import 'package:flutter/material.dart';

import 'package:third_exam_n8/utils/path.dart';

class CategoryProductsScreen extends StatelessWidget {
  CategoryProductsScreen({Key? key, required this.category}) : super(key: key);
  CategoryModel category;
  ApiProvider provider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: FutureBuilder(
        future: provider.fetchCategoryProductsByID(id: category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            final products = snapshot.data!;

            return (products.statusCode == 200)
                ? ProductsListView(products: products.data)
                : Center(
                    child: Text(
                      "Status code : ${products.statusCode}${products.error}",
                    ),
                  );
          }
          return Center(child: Text(snapshot.data.toString()));
        },
      ),
    );
  }
}
