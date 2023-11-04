//import 'package:crf_music_app/shared/models/music_model.dart';
//import 'package:crf_music_app/shared/widgets/image_widget.dart';
//import 'package:crf_music_app/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:musinorte_app/shared/models/music_model.dart';
import 'package:musinorte_app/shared/widgets/text_widget.dart';

import '../../../../../widgets/image_widget.dart';

class MusicPlayerMusicInfo extends StatelessWidget {
  final MusicModel music;

  const MusicPlayerMusicInfo({
    required this.music,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (_, BoxConstraints constraints) {
            return ImageWidget(
              height: constraints.maxWidth,
              width: constraints.maxWidth,
              img: music.img,
            );
          },
        ),
        const SizedBox(height: 14),
        Align(
          alignment: Alignment.topLeft,
          child: TextWidget(music.title),
        ),
      ],
    );
  }
}
