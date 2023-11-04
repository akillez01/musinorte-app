//import 'package:crf_music_app/shared/widgets/text_widget.dart';
import 'package:musinorte_app/shared/widgets/text_widget.dart';
import 'button_widget.dart';
import 'package:flutter/material.dart';

class AppMusicErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback? onTryAgain;

  const AppMusicErrorWidget({
    required this.error,
    this.onTryAgain,
    super.key,
  });
  //: super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Daime Music",
          style: TextStyle(
            color: Color.fromARGB(255, 238, 232, 232),
            fontSize: 50,
          ),
        ),
        TextWidget.normal(
          error,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        if (onTryAgain != null)
          ButtonWidget(
            title: "Tentar novamente",
            onPressed: onTryAgain!,
          ),
      ],
    );
  }
}
