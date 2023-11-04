//import 'package:crf_music_app/core/errors/exceptions.dart';
//import 'package:crf_music_app/core/services/api_service.dart';
//
//import 'package:crf_music_app/shared/models/genre_model.dart';
import 'package:dartz/dartz.dart';

//import 'package:crf_music_app/core/errors/failures.dart';
import 'package:musinorte_app/core/errors/exceptions.dart';
import 'package:musinorte_app/core/errors/failures.dart';
import 'package:musinorte_app/core/services/api_service.dart';
import 'package:musinorte_app/shared/models/genre_model.dart';

class GenreListRepository {
  final ApiService _apiService;

  GenreListRepository({required ApiService apiService})
      : _apiService = apiService;

  Future<Either<Failure, List<GenreModel>>> getGenreList() async {
    try {
      final genres = await _apiService.getGenres();

      return Right(genres);
    } on ApiException catch (apiException) {
      return Left(GetGenreListFailure(apiException.message));
    } on GeneralException catch (generalException) {
      return Left(GetGenreListFailure(generalException.message));
    }
  }
}
