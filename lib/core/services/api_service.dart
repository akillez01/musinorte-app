import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:musinorte_app/core/errors/exceptions.dart';
import 'package:musinorte_app/shared/models/genre_details_model.dart';
import 'package:musinorte_app/shared/models/genre_model.dart';

class ApiService extends DioForNative {
  ApiService([super.baseOptions]);

  Future<List<GenreModel>> getGenres() async {
    try {
      const endPoint = "/genres";

      final response = await get(endPoint);

      return (response.data as List)
          .map((genre) => GenreModel.fromMap(genre))
          .toList();
    } on DioException catch (dioException, stackTrace) {
      log(
        "Erro ao fazer o get dos generos musicais",
        error: dioException,
        stackTrace: stackTrace,
      );
      throw ApiException(
        message: "Erro ao carregar gêneros.",
        statusCode: dioException.response?.statusCode,
      );
    } catch (error, stackTrace) {
      log(
        "Error ao fazer o get dos gêneros musicais",
        error: error,
        stackTrace: stackTrace,
      );
      throw GeneralException();
    }
  }

  Future<GenreDetailsModel> getGenreDetails({required String genre}) async {
    try {
      final endPoint = "/genres-$genre";

      final response = await get(endPoint);

      return GenreDetailsModel.fromMap(response.data);
    } on DioException catch (dioException, stackTrace) {
      log(
        "Erro ao fazer o get dos detalhes do gênero musical.",
        error: dioException,
        stackTrace: stackTrace,
      );
      throw ApiException(
        message: "Erro ao fazer o get dos detalhes do gênero musical.",
        statusCode: dioException.response?.statusCode,
      );
    } catch (error, stackTrace) {
      log(
        "Erro ao fazer o get dos detalhes gêneros musicais.",
        error: error,
        stackTrace: stackTrace,
      );
      throw GeneralException();
    }
  }
}
