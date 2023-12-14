import 'package:flutter/material.dart';
import 'package:nasapic/core/utils/date_helpers.dart';
import 'package:nasapic/design_system/themes/custom_colors.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';

class PictureItemPage extends StatelessWidget {
  final PictureItem pictureItem;

  const PictureItemPage({super.key, required this.pictureItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(pictureItem.imageUrl),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  Text(
                    pictureItem.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: CustomColors.chocolateCosmos,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    pictureItem.date.toStringRemote(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: CustomColors.khaki,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    pictureItem.explanation,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: CustomColors.eggPlantTextColor,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
