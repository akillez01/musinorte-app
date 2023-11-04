//import 'package:crf_music_app/core/app/music_app_colors.dart';
//import 'package:crf_music_app/features/genre_details/presentation/controllers/genre_details_controller.dart';
//import 'package:crf_music_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
//import 'package:crf_music_app/shared/features/music_app/presentation/widgets/circular_progress_indicator_widget.dart';
//import 'package:crf_music_app/shared/models/music_model.dart';
//import 'package:crf_music_app/shared/widgets/app_music_error_widget.dart';
//import 'package:crf_music_app/shared/widgets/img_and_title_row_widget.dart';
//import 'package:crf_music_app/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musinorte_app/core/app/music_app_colors.dart';
import 'package:musinorte_app/features/genre_details/presentation/controllers/genre_details_controller.dart';
import 'package:musinorte_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:musinorte_app/shared/features/music_app/presentation/widgets/circular_progress_indicator_widget.dart';
import 'package:musinorte_app/shared/models/music_model.dart';
import 'package:musinorte_app/shared/widgets/app_music_error_widget.dart';
import 'package:musinorte_app/shared/widgets/img_and_title_row_widget.dart';
import 'package:musinorte_app/shared/widgets/text_widget.dart';

class GenreDetailsMusicListWidget extends StatelessWidget {
  final String genreSearchString;

  const GenreDetailsMusicListWidget({
    required this.genreSearchString,
    super.key,
  });

  Color _getMusicTitleColor(
      MusicModel currentMusicInList, MusicModel? currentMusicPlaying) {
    if (currentMusicInList.title == currentMusicPlaying?.title) {
      return MusicAppColors.tertiaryColor;
    }
    return MusicAppColors.secondaryColor;
  }

  @override
  Widget build(BuildContext context) {
    final genreDetailsController = Get.find<GenreDetailsController>();
    final musicPlayerController = Get.find<MusicPlayerController>();

    return Obx(
      () => SliverList(
        delegate: SliverChildListDelegate(
          [
            const SizedBox(height: 8),
            if (genreDetailsController.getIsLoading)
              const CircularProgressIndicatorWidget(),
            if (!genreDetailsController.getIsLoading &&
                genreDetailsController.getError != null)
              AppMusicErrorWidget(
                error: genreDetailsController.getError!,
                onTryAgain: () =>
                    genreDetailsController.loadGenreDetails(genreSearchString),
              ),
            if (!genreDetailsController.getIsLoading &&
                genreDetailsController.getError == null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget('Músicas'),
                    const SizedBox(height: 12),
                    ...genreDetailsController.genreDetails?.musics
                            .asMap()
                            .map((int index, MusicModel music) =>
                                MapEntry(index, Builder(
                                  builder: (builderContext) {
                                    return Column(
                                      children: [
                                        InkWell(
                                          onTap: () => musicPlayerController
                                              .playSelectedMusic(
                                                  context, index),
                                          child: ImgAndTitleRowWidget(
                                            title: music.title,
                                            heroTag: index.toString(),
                                            img: music.img,
                                            titleColor: _getMusicTitleColor(
                                              music,
                                              musicPlayerController
                                                  .getCurrentPlayingMusic,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                      ],
                                    );
                                  },
                                )))
                            .values
                            .toList() ??
                        [],
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
