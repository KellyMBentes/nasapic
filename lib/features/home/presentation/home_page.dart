import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasapic/design_system/assets/images.dart';
import 'package:nasapic/design_system/resources/break_points.dart';
import 'package:nasapic/design_system/resources/strings.dart';
import 'package:nasapic/design_system/widgets/custom_search_bar.dart';
import 'package:nasapic/design_system/widgets/mobile_app_bar.dart';
import 'package:nasapic/design_system/widgets/rounded_corner_subpage.dart';
import 'package:nasapic/design_system/widgets/web_app_bar.dart';
import 'package:nasapic/features/picture_of_the_day/presentation/bloc/picture_of_the_day_bloc.dart';
import 'package:nasapic/features/picture_of_the_day/presentation/widgets/pictures_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  PreferredSizeWidget _getAppBar(double maxWidth) {
    if (maxWidth <= mobileBreakpoint) {
      return const MobileAppBar(
        title: Strings.appName,
      );
    } else {
      return WebAppBar(
        companyIcon: const Image(
          image: AssetImage(Images.icArowLeft),
        ),
        title: Strings.appName,
        searchBar: _CustomSearchBarImpl(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: _getAppBar(constraints.maxWidth),
        body: Column(
          children: [
            if (constraints.maxWidth <= mobileBreakpoint)
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                child: _CustomSearchBarImpl(),
              ),
            const Expanded(
              child: RoundedCornerSubpage(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Expanded(child: PicturesSection())],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _CustomSearchBarImpl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomSearchBar(
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
    );
  }
}
