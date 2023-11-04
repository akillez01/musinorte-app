//import 'package:shelf/shelf.dart' as shelf_io;
import 'package:flutter/material.dart';
//import 'package:crf_music_app/core/app/music_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:musinorte_app/core/app/music_app.dart';
//import 'package:dartz/dartz.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(const MusicApp());
}

