part of 'picture_of_the_day_bloc.dart';

@freezed
class PictureOfTheDayEvent with _$PictureOfTheDayEvent {
  const factory PictureOfTheDayEvent.getAllPictures(int page) = _GetAllPictures;
  const factory PictureOfTheDayEvent.searchPicturesByName(String name) = _SearchPicturesByName;
  const factory PictureOfTheDayEvent.searchPicturesByDate(DateTime date) = _SearchPicturesByDate;
  const factory PictureOfTheDayEvent.refresh() = _Refresh;
}
