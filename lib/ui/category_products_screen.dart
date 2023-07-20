import 'package:flutter/material.dart';
import 'package:third_exam_n8/models/category_model.dart';
import 'package:third_exam_n8/models/universal_model.dart';
import 'package:third_exam_n8/network/api_provider.dart';
import 'package:third_exam_n8/ui/subscreen/products_listview.dart';

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
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              final products = snapshot.data! as UniversalModel;
              print(products.error);
              return (products.statusCode == 200)
                  ? ProductsListView(products: products.data)
                  : Center(
                      child: Text("Status code : " +
                          products.statusCode.toString() +
                          products.error));
            }
            return Center(child: Text(snapshot.data.toString()));
          },
        ));
  }
}
