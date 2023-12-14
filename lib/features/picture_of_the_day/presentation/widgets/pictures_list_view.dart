import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasapic/core/utils/date_helpers.dart';
import 'package:nasapic/features/picture_of_the_day/presentation/bloc/picture_of_the_day_bloc.dart';

class PicturesListView extends StatefulWidget {
  const PicturesListView({super.key});

  @override
  State<PicturesListView> createState() => _PicturesListViewState();
}

class _PicturesListViewState extends State<PicturesListView> {
  bool _canLoadNextPage = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PictureOfTheDayBloc, PictureOfTheDayState>(
      listener: (context, state) {
        _canLoadNextPage = !state.isLoading;
      },
      builder: (context, state) {
        if (state.isLoading && state.pictures.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.pictureFailure != null) {
          return Center(
            child: Text(state.pictureFailure.toString()),
          );
        } else {
          final pictures = state.pictures;
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              final metrics = notification.metrics;
              final limit = metrics.maxScrollExtent - metrics.viewportDimension / 3;

              if (_canLoadNextPage && metrics.pixels >= limit) {
                _canLoadNextPage = false;
                context.read<PictureOfTheDayBloc>().add(PictureOfTheDayEvent.getAllPictures(state.page + 1));
              }
              return false;
            },
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: pictures.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Text('${pictures.elementAt(index).date.toStringRemote()} - ${pictures.elementAt(index).title}'),
                    Image.network(
                      pictures.elementAt(index).imageUrl,
                    ),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
