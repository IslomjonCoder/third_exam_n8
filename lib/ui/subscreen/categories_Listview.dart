import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:third_exam_n8/models/category_model.dart';
import 'package:third_exam_n8/models/universal_model.dart';
import 'package:third_exam_n8/network/api_provider.dart';
import 'package:third_exam_n8/utils/colors.dart';
import 'package:third_exam_n8/utils/routes.dart';
import 'package:third_exam_n8/utils/style.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({Key? key, required this.categories}) : super(key: key);
  List<CategoryModel> categories;
  ApiProvider provider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          CategoryModel category = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.categoryProducts,
                  arguments: category);
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      category.name,
                      style: AppStyle.headline,
                    ),
                  ),
                  Container(
                    width: 82,
                    child: CachedNetworkImage(
                      imageUrl: category.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              height: 100,
              decoration: BoxDecoration(
                  color: AppColors.cF5F5F5,
                  borderRadius: BorderRadius.circular(15)),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 16,
            ),
        itemCount: categories.length);
  }
}
