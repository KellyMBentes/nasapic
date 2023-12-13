import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/get_all_pictures.dart' as get_all;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_date.dart' as search_by_date;
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/search_picture_by_title.dart' as search_by_title;
import 'package:nasapic/features/picture_of_the_day/erros/picture_failure.dart';

part 'picture_of_the_day_event.dart';
part 'picture_of_the_day_state.dart';
part 'picture_of_the_day_bloc.freezed.dart';

@injectable
class PictureOfTheDayBloc extends Bloc<PictureOfTheDayEvent, PictureOfTheDayState> {
  final get_all.GetAllPictures _getAllPictures;
  final search_by_date.SearchPicturesByDate _searchPicturesByDate;
  final search_by_title.SearchPicturesByTitle _searchPicturesByTitle;

  PictureOfTheDayBloc(this._getAllPictures, this._searchPicturesByDate, this._searchPicturesByTitle) : super(PictureOfTheDayState.initial()) {
    on<PictureOfTheDayEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, pictureFailure: null));
      await event.map(
          getAllPictures: (event) async {
            final failureOrSuccess = await _getAllPictures(get_all.Params(page: event.page));
            emit(
              failureOrSuccess.fold(
                (failure) => state.copyWith(
                  isLoading: false,
                  pictureFailure: failure,
                ),
                (success) {
                  List<PictureItem> picturesSorted = [...state.pictures, ...success];
                  picturesSorted.sort(((a, b) => b.date.compareTo(a.date)));

                  return state.copyWith(
                    isLoading: false,
                    page: state.page + 1,
                    pictures: picturesSorted.toSet(),
                  );
                },
              ),
            );
          },
          searchPicturesByName: (e) async {},
          searchPicturesByDate: (e) async {},
          refresh: (e) async {});
    });
  }
}
