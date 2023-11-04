//import 'dart:ffi';
import 'package:get/get.dart';
//import 'package:crf_music_app/core/errors/failures.dart';
//import 'package:crf_music_app/shared/models/genre_model.dart';
//import 'package:crf_music_app/core/mixins/screen_loading_and_error_mixin.dart';
import 'package:musinorte_app/core/errors/failures.dart';
import 'package:musinorte_app/core/mixins/screen_loading_and_error_mixin.dart';
import 'package:musinorte_app/shared/models/genre_model.dart';
import '../../data/repositories/genre_list_repository.dart';

class GenreListController extends GetxController
    with ScreenLoadingAndErrorMixin {
  final GenreListRepository _genreListRepository;

  GenreListController(GenreListRepository genreListRepository)
      : _genreListRepository = genreListRepository;

  final RxList<GenreModel> genres = RxList([]);

  @override
  get getError => null;

  @override
  get getIsLoading async => null;

  @override
  void onInit() {
    getGengeList();
    super.onInit();
  }

  Future<void> getGengeList() async {
    setLoadingToTrue();
    setError(null);

    final getGenresRensponse = await _genreListRepository.getGenreList();

    getGenresRensponse.fold((Failure failureResponse) {
      if (failureResponse is GetGenreListFailure) {
        setError(failureResponse.message);
      }
    }, (List<GenreModel> genreRensponse) {
      genres.value = genreRensponse;
    });

    setLoadingToFalse();
  }
}
