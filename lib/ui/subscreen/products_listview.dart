import 'package:flutter/material.dart';

import 'package:third_exam_n8/utils/path.dart';

class ProductsListView extends StatefulWidget {
  ProductsListView({Key? key, required this.products}) : super(key: key);
  List<ProductModel> products;

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  List<ProductModel> favourites = RepositoryFavourites.getAll;
  List<BasketItem> basket = RepositoryBasket.getAll();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 15,
        childAspectRatio: 0.6,
      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        final ProductModel product = widget.products[index];
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Spacer(),
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: product.imageUrl,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                // const Spacer(),
                const SizedBox(height: 10),
                Text(
                  product.name,
                  style: AppStyle.body2.copyWith(color: AppColors.c606060),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$ ${product.price}",
                  style: AppStyle.body2.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.c303030,
                  ),
                ),
                CardWidget(
                  product: product,
                  isInCard: basket
                      .map((e) => e.product.id)
                      .toList()
                      .contains(product.id),
                )
              ],
            ),
            Positioned(
              right: 8,
              top: 8,
              child: SavedIcon(
                product: product,
                isSelected: favourites.map((e) => e.id).contains(product.id),
                // isSelected: (favourites
                //     .map((e) => (e.id as ProductModel))
                //     .toList()
                //     .contains(product.id)),
              ),
            ),
          ],
        );
      },
    );
  }
}
