part of 'picture_of_the_day_bloc.dart';

@freezed
class PictureOfTheDayState with _$PictureOfTheDayState {
  const factory PictureOfTheDayState({
    required Set<PictureItem> pictures,
    required List<PictureItem> filtredPictures,
    required dynamic filter,
    required bool isLoading,
    required PictureFailure? pictureFailure,
    required int page,
  }) = _PictureOfTheDayState;

  factory PictureOfTheDayState.initial() => PictureOfTheDayState(
        pictures: (<PictureItem>[]).toSet(),
        filtredPictures: [],
        filter: null,
        isLoading: true,
        pictureFailure: null,
        page: 0,
      );
}
