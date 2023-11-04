//import 'package:crf_music_app/core/app/music_app_colors.dart';
//import 'package:crf_music_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
//import 'package:crf_music_app/shared/features/music_app/presentation/widgets/music_player_controls/widgets/play_pause_button_widget.dart';
//import 'package:crf_music_app/shared/features/music_app/presentation/widgets/widgets/play_pause_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musinorte_app/core/app/music_app_colors.dart';
import 'package:musinorte_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:musinorte_app/shared/features/music_app/presentation/widgets/music_player_controls/widgets/play_pause_button_widget.dart';

class MusicPlayerControlsWidget extends StatelessWidget {
  final String musicPath;

  const MusicPlayerControlsWidget({
    required this.musicPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final musicPlayerController = Get.find<MusicPlayerController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 70,
          onPressed: () => musicPlayerController.backTrack(),
          icon: Icon(
            Icons.skip_previous,
            color: MusicAppColors.secondaryColor,
          ),
          padding: const EdgeInsets.all(0),
        ),
        const SizedBox(width: 40),
        PlayPauseButtonWidget(musicUrl: musicPath),
        const SizedBox(width: 40),
        IconButton(
          iconSize: 70,
          onPressed: () => musicPlayerController.skipTrack(),
          icon: Icon(
            Icons.skip_next,
            color: MusicAppColors.secondaryColor,
          ),
          padding: const EdgeInsets.all(0),
        ),
      ],
    );
  }
}
