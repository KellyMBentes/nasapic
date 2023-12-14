import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasapic/design_system/widgets/custom_search_bar.dart';
import 'package:nasapic/design_system/widgets/rounded_corner_subpage.dart';
import 'package:nasapic/features/picture_of_the_day/presentation/bloc/picture_of_the_day_bloc.dart';
import 'package:nasapic/features/picture_of_the_day/presentation/widgets/pictures_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        extendBodyBehindAppBar: false,
        body: Column(
          children: [
            Expanded(
              child: RoundedCornerSubpage(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  CustomSearchBar(
                    onSearch: (title, date) {
                      final bloc = context.read<PictureOfTheDayBloc>();
                      if (title != null && title.isEmpty) {
                        bloc.add(const PictureOfTheDayEvent.cleanFilters());
                      } else if (title != null) {
                        bloc.add(PictureOfTheDayEvent.searchPicturesByTitle(title));
                      } else if (date != null) {
                        bloc.add(PictureOfTheDayEvent.searchPicturesByDate(date));
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  const Expanded(child: PicturesSection()),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
