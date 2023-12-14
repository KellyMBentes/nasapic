import 'package:flutter/material.dart';

class PictureItemGrid extends StatelessWidget {
  final List<Widget> children;

  const PictureItemGrid({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 600,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.90,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
      );
    });
  }
}
