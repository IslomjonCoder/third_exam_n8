import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:third_exam_n8/widgets/shimmer_skeleton.dart';

class CatShimmer extends StatelessWidget {
  const CatShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.white,
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        separatorBuilder: (context, index) => SizedBox(
          height: 20,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Skeleton(
            height: 100,
            width: double.infinity,
          );
        },
      ),
    );
  }
}
