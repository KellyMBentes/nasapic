import 'package:flutter/material.dart';
import 'package:nasapic/design_system/widgets/picture_item_widget.dart';
import 'package:shimmer/shimmer.dart';

class PictureItemShimmer extends StatelessWidget {
  const PictureItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: PictureItemWidget(image: const SizedBox(width: double.infinity), title: 'Place Holder', date: DateTime.now(), onClick: () {}),
    );
  }
}
