import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/style/app_colors.dart';

class LoadingShimmerWidget extends StatelessWidget {
  const LoadingShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: List.generate(
          3,
              (index) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: buildShimmer(100, 150, radius: 16),
                ),
                buildShimmer(double.infinity, 14),
                const SizedBox(height: 4),
                buildShimmer(double.infinity, 16),
              ],
            ),
          )).toList(),
    );
  }

  Widget buildShimmer(double width, double height, {double radius = 12}) => Shimmer.fromColors(
    baseColor: ColorName.white,
    highlightColor: ColorName.silver,
    child: SizedBox(
      width: width,
      height: height,
      child: const SizedBox(),
    ),
  );

}