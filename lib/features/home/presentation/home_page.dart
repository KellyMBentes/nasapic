import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  final metrics = notification.metrics;
                  final limit = metrics.maxScrollExtent - metrics.viewportDimension / 3;
                  final bloc = context.read<PictureOfTheDayBloc>();
                  if (!bloc.state.isLoading && metrics.pixels >= limit) {
                    final bloc = context.read<PictureOfTheDayBloc>();
                    bloc.add(PictureOfTheDayEvent.getAllPictures(bloc.state.page + 1));
                  }
                  return false;
                },
                child: const RoundedCornerSubpage(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PicturesSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
