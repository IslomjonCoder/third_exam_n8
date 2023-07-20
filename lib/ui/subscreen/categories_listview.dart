import 'package:flutter/material.dart';

import 'package:third_exam_n8/utils/path.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({Key? key, required this.categories}) : super(key: key);
  List<CategoryModel> categories;
  ApiProvider provider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.cF5F5F5,
              borderRadius: BorderRadius.circular(15),
            ),
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
                SizedBox(
                  width: 82,
                  child: CachedNetworkImage(
                    imageUrl: category.imageUrl,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              RouteNames.categoryProducts,
              arguments: category,
            );
          },
        );
      },
      itemCount: categories.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
    );
  }
}
