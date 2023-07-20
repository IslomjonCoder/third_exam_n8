import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:third_exam_n8/widgets/shimmer_skeleton.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Skeleton(
                height: 150,
                width: double.infinity,
              ),
              SizedBox(height: 10),
              Skeleton(
                height: 20,
                width: 120,
              ),
              SizedBox(height: 10),
              Skeleton(
                height: 20,
                width: 70,
              ),
              SizedBox(height: 10),
              Skeleton(
                height: 40,
                width: double.infinity,
              ),
            ],
          );
        },
      ),
    );
  }
}
