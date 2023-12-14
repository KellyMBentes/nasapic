import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasapic/design_system/widgets/picture_item_grid.dart';
import 'package:nasapic/design_system/widgets/picture_item_shimmer.dart';
import 'package:nasapic/design_system/widgets/picture_item_widget.dart';
import 'package:nasapic/features/picture_of_the_day/presentation/bloc/picture_of_the_day_bloc.dart';

class PicturesSection extends StatefulWidget {
  const PicturesSection({super.key});

  @override
  State<PicturesSection> createState() => _PicturesSectionState();
}

class _PicturesSectionState extends State<PicturesSection> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PictureOfTheDayBloc, PictureOfTheDayState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading && state.pictures.isEmpty) {
          return PictureItemGrid(
            children: [
              for (int i = 0; i < 20; i++) const PictureItemShimmer(),
            ],
          );
        } else if (state.pictureFailure != null) {
          return Text(state.pictureFailure.toString());
        } else {
          final pictures = state.pictures;
          return PictureItemGrid(
            children: [
              for (int i = 0; i < pictures.length; i++)
                SizedBox(
                  child: PictureItemWidget(
                    image: Image.network(
                      pictures.elementAt(i).imageUrl,
                      fit: BoxFit.cover,
                    ),
                    title: pictures.elementAt(i).title,
                    date: pictures.elementAt(i).date,
                    onClick: () {},
                  ),
                ),
            ],
          );
        }
      },
    );
  }
}
