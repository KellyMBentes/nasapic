import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nasapic/core/usecases/usecase.dart';
import 'package:nasapic/features/picture_of_the_day/domain/entities/picture_item.dart';
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/clean_cache.dart';
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
  final CleanCache _cleanCache;

  PictureOfTheDayBloc(this._getAllPictures, this._searchPicturesByDate, this._searchPicturesByTitle, this._cleanCache)
      : super(PictureOfTheDayState.initial()) {
    on<PictureOfTheDayEvent>((event, emit) async {
      await event.map(
        getAllPictures: (event) async {
          if (state.page >= event.page) return;
          emit(state.copyWith(isLoading: true, pictureFailure: null));
          final failureOrSuccess = await _getAllPictures(get_all.Params(page: event.page));
          emit(
            failureOrSuccess.fold(
              (failure) => state.copyWith(
                isLoading: false,
                pictureFailure: failure,
              ),
              (success) {
                List<PictureItem> sortedList = success.toList();
                sortedList.sort(((a, b) => b.date.compareTo(a.date)));
                return state.copyWith(
                  isLoading: false,
                  page: event.page,
                  pictures: <PictureItem>{...state.pictures, ...sortedList},
                );
              },
            ),
          );
        },
        searchPicturesByTitle: (event) async {
          if (state.isLoading) return;
          emit(state.copyWith(isLoading: true, pictureFailure: null));
          final failureOrSuccess = await _searchPicturesByTitle(search_by_title.Params(title: event.title, pictures: state.pictures.toList()));
          emit(
            failureOrSuccess.fold(
              (failure) => state.copyWith(
                isLoading: false,
                filter: event.title,
                pictureFailure: failure,
              ),
              (searchResult) {
                searchResult.sort(((a, b) => b.date.compareTo(a.date)));
                return state.copyWith(
                  isLoading: false,
                  filter: event.title,
                  filtredPictures: searchResult,
                );
              },
            ),
          );
        },
        searchPicturesByDate: (event) async {
          emit(state.copyWith(isLoading: true, pictureFailure: null));
          final failureOrSuccess = await _searchPicturesByDate(search_by_date.Params(date: event.date));
          emit(
            failureOrSuccess.fold(
              (failure) => state.copyWith(
                isLoading: false,
                filter: event.date,
                pictureFailure: failure,
              ),
              (searchResult) {
                return state.copyWith(
                  isLoading: false,
                  filter: event.date,
                  filtredPictures: [searchResult],
                );
              },
            ),
          );
        },
        cleanFilters: (event) async {
          emit(state.copyWith(isLoading: false, filtredPictures: [], filter: null));
        },
        refresh: (event) async {
          emit(PictureOfTheDayState.initial().copyWith(isLoading: true));
          final failureOrSuccess = await _cleanCache(const NoParams());
          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                isLoading: false,
                pictureFailure: failure,
              ),
            ),
            (success) => add(
              const PictureOfTheDayEvent.getAllPictures(1),
            ),
          );
        },
      );
    });
  }
}
