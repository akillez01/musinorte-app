//import 'package:crf_music_app/core/app/music_app_colors.dart';
//
//import 'package:crf_music_app/shared/features/music_app/presentation/widgets/circular_progress_indicator_widget.dart';
//import 'package:crf_music_app/shared/widgets/app_music_error_widget.dart';
//import 'package:crf_music_app/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:musinorte_app/shared/features/music_app/presentation/widgets/circular_progress_indicator_widget.dart';
import 'package:musinorte_app/shared/widgets/app_music_error_widget.dart';
import 'package:musinorte_app/shared/widgets/text_widget.dart';

class ScreenWidget extends StatelessWidget {
  final bool isLoading;
  final String? error;
  final String title;
  final Widget child;
  final VoidCallback? onTryAgain;

  const ScreenWidget({
    required this.isLoading,
    this.error,
    required this.title,
    required this.child,
    this.onTryAgain,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget.bold(title),
      ),
      body: ColoredBox(
        color: const Color(0xFF064D10),
        child: SizedBox.expand(
          child: isLoading || error != null
              ? Center(
                  child: isLoading
                      ? const CircularProgressIndicatorWidget()
                      : AppMusicErrorWidget(
                          error: error!,
                          onTryAgain: onTryAgain,
                        ),
                )
              : child,
        ),
      ),
    );
  }
}

class State<MyApp> {
  //get selectedLabelStyle => null;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Define o debugShowCheckedModeBanner como false para ocultar a faixa de depuração.
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white10,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
        ),
      ),
      //home: const Tabbar(), //      color: Colors.red,
    );
  }
}
