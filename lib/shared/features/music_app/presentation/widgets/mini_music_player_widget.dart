import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musinorte_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:musinorte_app/shared/widgets/text_widget.dart';
import '../../../../../core/app/music_app_colors.dart';
import '../../../../widgets/image_widget.dart';
import 'music_player_controls/widgets/play_pause_button_widget.dart';

class MiniMusicPlayerWidget extends StatelessWidget {
  const MiniMusicPlayerWidget({super.key}); //{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final musicPlayeController = Get.find<MusicPlayerController>();

    return GestureDetector(
      onTap: () => musicPlayeController.showMusicPlayer(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MusicAppColors.primaryColor,
              MusicAppColors.tertiaryColor.withOpacity(0.5),
            ],
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 8,
              ),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          ImageWidget(
                            height: 50,
                            width: 50,
                            img: musicPlayeController
                                .getCurrentPlayingMusic?.img,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextWidget.normal(
                              musicPlayeController
                                      .getCurrentPlayingMusic?.title ??
                                  'musica 1',
                            ),
                          ),
                        ],
                      ),
                    ),
                    PlayPauseButtonWidget(
                      musicUrl:
                          musicPlayeController.getCurrentPlayingMusic?.url,
                      playPauseButtonSize: PlayPauseButtonSize.small,
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder(
              stream: musicPlayeController.getCurrentPositionStream,
              builder: (_, AsyncSnapshot<Duration> snapshot) {
                final currentPositionInSeconds = snapshot.data?.inSeconds ??
                    musicPlayeController.currentMusicDuration.value;

                return LinearProgressIndicator(
                  value: (currentPositionInSeconds /
                          (musicPlayeController
                                  .getCurrentPlayingMusic?.duration ??
                              0))
                      .clamp(0, 1),
                  backgroundColor: Colors.grey.shade600,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    MusicAppColors.secondaryColor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
