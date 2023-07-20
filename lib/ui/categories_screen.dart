import 'package:flutter/material.dart';

import 'package:third_exam_n8/utils/path.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  ApiProvider provider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: FutureBuilder(
        future: provider.fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            final categories = snapshot.data!;

            return (categories.statusCode == 200)
                ? CategoriesListView(categories: categories.data)
                : Center(
                    child: Text(
                      "Status code : ${categories.statusCode}${categories.error}",
                    ),
                  );
          }
          return Center(child: Text(snapshot.data.toString()));
        },
      ),
    );
  }
}
