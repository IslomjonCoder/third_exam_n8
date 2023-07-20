import 'package:flutter/material.dart';
import 'package:third_exam_n8/models/universal_model.dart';
import 'package:third_exam_n8/network/api_provider.dart';
import 'package:third_exam_n8/ui/subscreen/categories_Listview.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  ApiProvider provider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body: FutureBuilder(
          future: provider.fetchCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              final categories = snapshot.data! as UniversalModel;
              print(categories.error);
              return (categories.statusCode == 200)
                  ? CategoriesListView(categories: categories.data)
                  : Center(
                      child: Text("Status code : " +
                          categories.statusCode.toString() +
                          categories.error));
            }
            return Center(child: Text(snapshot.data.toString()));
          },
        ));
  }
}
