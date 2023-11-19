import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musinorte_app/core/app/music_app_colors.dart';
import 'package:musinorte_app/core/extensions/duration_extension.dart';
import 'package:musinorte_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:musinorte_app/shared/widgets/text_widget.dart';

class MusicPlayerMusicDurationWidget extends StatefulWidget {
  final int duration;

  const MusicPlayerMusicDurationWidget({
    required this.duration,
    super.key, //Key? key,
  }); //: super(key: key);

  @override
  State<MusicPlayerMusicDurationWidget> createState() =>
      _MusicPlayerMusicDurationWidgetState();
}

class _MusicPlayerMusicDurationWidgetState
    extends State<MusicPlayerMusicDurationWidget> {
  final sliderValueRx = RxnDouble();

  @override
  Widget build(BuildContext context) {
    final musicPlayerController = Get.find<MusicPlayerController>();

    return StreamBuilder(
      stream: musicPlayerController.getCurrentPositionStream,
      builder: (context, AsyncSnapshot<Duration> snapshot) {
        final seconds = snapshot.data?.inSeconds ??
            musicPlayerController.currentMusicDuration.value;

        return Column(
          children: [
            Obx(
              () => Slider(
                value: (sliderValueRx.value ?? seconds / widget.duration)
                    .clamp(0, 1),
                onChanged: (double sliderValue) async {
                  await musicPlayerController.seek(
                    (sliderValue * widget.duration).floor(),
                  );
                  sliderValueRx.value = null;
                },
                activeColor: MusicAppColors.secondaryColor,
                inactiveColor: Colors.grey.shade600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget.small(seconds.fromSecondsToMinutesString),
                TextWidget.small(
                  '- ${(widget.duration - seconds).fromSecondsToMinutesString}',
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
