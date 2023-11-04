import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
//import 'package:crf_music_app/core/app/music_app_initial_bindings.dart';
//import 'package:crf_music_app/core/app/music_app_material.dart';
//import 'package:crf_music_app/features/genre_list/presentation/screens/genre_list_screen.dart';
import 'package:musinorte_app/core/app/music_app_initial_bindings.dart';
import 'package:musinorte_app/core/app/music_app_material.dart';
import 'package:musinorte_app/features/genre_list/presentation/screens/genre_list_screen.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: MusicAppMaterial.getTitle,
      //themeMode: ThemeMode.dark,
      theme: MusicAppMaterial.getTheme,
      getPages: MusicAppMaterial.getPages,
      initialRoute: GenreListScreen.routeName,
      initialBinding: MusicAppInitialBindings(),
    );
  }
}
