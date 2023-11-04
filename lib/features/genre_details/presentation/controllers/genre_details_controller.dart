//import 'package:crf_music_app/core/errors/failures.dart';
//import 'package:crf_music_app/core/mixins/screen_loading_and_error_mixin.dart';
//import 'package:crf_music_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
//import 'package:crf_music_app/shared/models/genre_details_model.dart';
//import 'package:crf_music_app/shared/models/genre_model.dart';
//import 'package:crf_music_app/shared/models/music_model.dart';
import 'package:get/get.dart';
import 'package:musinorte_app/core/errors/failures.dart';
import 'package:musinorte_app/core/mixins/screen_loading_and_error_mixin.dart';
import 'package:musinorte_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:musinorte_app/shared/models/genre_details_model.dart';
import 'package:musinorte_app/shared/models/genre_model.dart';
import 'package:musinorte_app/shared/models/music_model.dart';

import '../../data/repositories/genre_details_repository.dart';

class GenreDetailsController extends GetxController
    with ScreenLoadingAndErrorMixin {
  final GenreDetailsRepository _genreDetailsRepository;
  final MusicPlayerController _musicPlayerController;

  GenreDetailsController(GenreDetailsRepository genreDetailsRepository,
      MusicPlayerController musicPlayerController)
      : _genreDetailsRepository = genreDetailsRepository,
        _musicPlayerController = musicPlayerController;

  GenreDetailsModel? genreDetails;

  @override
  get getIsLoading => true;

  @override
  get getError => null;

  //bool? get getIsLoading => null;

  @override
  void onInit() {
    final genre = Get.arguments as GenreModel;

    loadGenreDetails(genre.searchString);

    super.onInit();
  }

  Future<void> loadGenreDetails(String genre) async {
    setLoadingToTrue();
    setError(null);

    final genreDetailsResponseEither =
        await _genreDetailsRepository.getGenreDetails(genre);

    genreDetailsResponseEither.fold((Failure failureResponse) {
      if (failureResponse is GetGenreDetailsFailure) {
        setError(failureResponse.message);
      }
    }, (GenreDetailsModel genreDetailsResponse) {
      genreDetails = genreDetailsResponse;

      //carrega a selected playlist do music player controller
      _musicPlayerController.loadPlaylist(
          genreDetailsResponse.musics, _musicPlayerController.selectedPlaylist);
    });

    setLoadingToFalse();
  }

  MusicModel? getMusicByIndex(int index) => genreDetails?.musics[index];

  List<MusicModel>? get getMusic => genreDetails?.musics;
}
