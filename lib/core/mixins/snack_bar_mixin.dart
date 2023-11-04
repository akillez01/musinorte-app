//import 'package:crf_music_app/core/app/music_app_colors.dart';
import 'package:get/get.dart';
import 'package:musinorte_app/core/app/music_app_colors.dart';

mixin SnackBarMixin {
  void showErrorSnackBar(String description) {
    Get.snackbar(
      "Erro",
      description,
      colorText: MusicAppColors.secondaryColor,
      backgroundColor: MusicAppColors.errorColor,
    );
  }
}
