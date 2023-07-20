import 'package:flutter/material.dart';

import 'package:third_exam_n8/utils/path.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  late List<ProductModel> products;

  @override
  void initState() {
    products = RepositoryFavourites.getAll;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites '),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          final ProductModel product = products[index];
          return SizedBox(
            height: 100,
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      product.name,
                      style: AppStyle.body2.copyWith(
                        color: AppColors.c606060,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "\$ ${product.price}",
                      style: AppStyle.subhead.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.c303030,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        RepositoryFavourites.deleteById(product);
                        products = RepositoryFavourites.getAll;
                        setState(() {});
                      },
                      child: SvgPicture.asset(AppImages.clear),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: products.length,
      ),
    );
  }
}
