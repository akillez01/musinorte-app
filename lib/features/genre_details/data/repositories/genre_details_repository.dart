import 'package:dartz/dartz.dart';
import 'package:musinorte_app/core/errors/exceptions.dart';
import 'package:musinorte_app/core/errors/failures.dart';
import 'package:musinorte_app/core/services/api_service.dart';
import 'package:musinorte_app/shared/models/genre_details_model.dart';

class GenreDetailsRepository {
  final ApiService _apiService;

  GenreDetailsRepository({required ApiService apiService})
      : _apiService = apiService;

  Future<Either<Failure, GenreDetailsModel>> getGenreDetails(
      String genre) async {
    try {
      final genreDetails = await _apiService.getGenreDetails(genre: genre);

      return Right(genreDetails);
    } on ApiException catch (apiException) {
      return Left(GetGenreDetailsFailure(apiException.message));
    } on GeneralException catch (generalException) {
      return Left(GetGenreDetailsFailure(generalException.message));
    }
  }
}
