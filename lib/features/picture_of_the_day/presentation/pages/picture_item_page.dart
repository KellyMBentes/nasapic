import 'package:flutter/material.dart';
import 'package:nasapic/core/utils/date_helpers.dart';
import 'package:nasapic/design_system/resources/break_points.dart';
import 'package:nasapic/design_system/resources/strings.dart';
import 'package:nasapic/design_system/themes/custom_colors.dart';
import 'package:nasapic/design_system/widgets/rounded_corner_subpage.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';

class PictureItemPage extends StatelessWidget {
  final PictureItem pictureItem;

  const PictureItemPage({super.key, required this.pictureItem});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: Text(
            Strings.pitureItemPageTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        body: RoundedCornerSubpage(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: (constraints.maxWidth <= mobileBreakpoint) ? _MobileBody(pictureItem: pictureItem) : _WebBody(pictureItem: pictureItem),
              ),
            )
          ],
        ),
      );
    });
  }
}

class _MobileBody extends StatelessWidget {
  final PictureItem pictureItem;

  const _MobileBody({required this.pictureItem});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class _WebBody extends StatelessWidget {
  final PictureItem pictureItem;

  const _WebBody({required this.pictureItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image.network(pictureItem.imageUrl)),
        Expanded(
          child: Padding(
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
        ),
      ],
    );
  }
}
