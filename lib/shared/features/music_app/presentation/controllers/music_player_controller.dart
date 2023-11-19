import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:musinorte_app/core/errors/exceptions.dart';
import 'package:musinorte_app/core/extensions/media_query_extension.dart';
import 'package:musinorte_app/core/services/audio_service/audio_player_service.dart';
import 'package:musinorte_app/shared/features/music_app/presentation/widgets/music_player_widget.dart';
import 'package:musinorte_app/shared/models/music_model.dart';
import '../../../../../core/mixins/snack_bar_mixin.dart';

class MusicPlayerController with SnackBarMixin {
  final AudioPlayerService _audioPlayer;

  MusicPlayerController(AudioPlayerService audioPlayer)
      : _audioPlayer = audioPlayer {
    // Ouve quando a música acabar para então pular para a próxima
    _audioCompleteStreamSubscription =
        _audioPlayer.onAudioComplete().listen((_) {
      skipTrack();
    });
  }

  StreamSubscription? _audioCompleteStreamSubscription;

  final RxBool isPlaying = false.obs;

  final RxInt currentMusicDuration = 0.obs;

  final RxnInt currentMusicIndexPlaying = RxnInt();

  int? get getCurrentMusicIndexPlaying => currentMusicIndexPlaying.value;

  final RxList<MusicModel> _playlistPlaying = <MusicModel>[].obs;

  List<MusicModel> get getPlaylistPlaying => _playlistPlaying;

  final List<MusicModel> selectedPlaylist = [];

  Stream<Duration> get getCurrentPositionStream =>
      _audioPlayer.getPositionStream();

  Future<void> seek(int seekToDurationInSeconds) =>
      _audioPlayer.seek(seekToDurationInSeconds);

  void loadPlaylist(
      List<MusicModel> newPlaylist, List<MusicModel> playlistToChange) {
    playlistToChange
      ..clear()
      ..addAll(newPlaylist);
  }

  Future<void> onCallMusicPlayerTryAndCatchFunction(
      Future<void> Function() tryFunction) async {
    try {
      await tryFunction();
    } on AudioPlayerException catch (error) {
      showErrorSnackBar(error.message);
    }
  }

  Future<void> playMusic(String url) async {
    return onCallMusicPlayerTryAndCatchFunction(() async {
      isPlaying.value = true;
      await _audioPlayer.playMusic(url);
    });
  }

  Future<void> stopMusic() async {
    return onCallMusicPlayerTryAndCatchFunction(() async {
      isPlaying.value = false;
      await _audioPlayer.stopMusic();
    });
  }

  Future<void> loadMusic() async {
    return onCallMusicPlayerTryAndCatchFunction(() async {
      //carregar a lista (carregar sempre para o caso o usuario tenha mudado o genero)
      loadPlaylist(selectedPlaylist, _playlistPlaying);

      //para musica se tiver tocando
      await stopMusic();

      //dar o play na musica
      await playMusic(_playlistPlaying[getCurrentMusicIndexPlaying ?? 0].url);
    });
  }

  Future<void> pauseMusic() async {
    return onCallMusicPlayerTryAndCatchFunction(() async {
      isPlaying.value = false;

      await _audioPlayer.pauseMusic();
    });
  }

  // Proxima musica
  Future<void> skipTrack() async {
    if (getCurrentMusicIndexPlaying != null) {
      if (getCurrentMusicIndexPlaying! < _playlistPlaying.length - 1) {
        currentMusicIndexPlaying.value = currentMusicIndexPlaying.value! + 1;
      } else {
        // Voltar para primeira musica se etiver na ultima
        currentMusicIndexPlaying.value = 0;
      }

      await loadMusic();
    }
  }

  MusicModel? get getCurrentPlayingMusic {
    if (getCurrentMusicIndexPlaying != null) {
      return _playlistPlaying[getCurrentMusicIndexPlaying!];
    }

    return null;
  }

  // voltar musica
  Future<void> backTrack() async {
    if (getCurrentMusicIndexPlaying != null &&
        getCurrentMusicIndexPlaying! > 0) {
      currentMusicIndexPlaying.value = currentMusicIndexPlaying.value! - 1;
    } else {
      //voltar para ultima musica se estiver na primeira
      currentMusicIndexPlaying.value = _playlistPlaying.length - 1;
    }

    await loadMusic();
  }

  void dispose() {
    _audioCompleteStreamSubscription?.cancel();
  }

  //quando abrir o player se estiver com a musica pausada devemos mostrar onde ela pausou
  Future<void> loadCurrentMusicDuration() async {
    if (!isPlaying.value) {
      currentMusicDuration.value = await _audioPlayer.getCurrentPosition;
    }
  }

  void playSelectedMusic(BuildContext context, int musicIndex) {
    // Atualiza qual o index da musioca sera ouvida da playlist
    currentMusicIndexPlaying.value = musicIndex;

    //carregar e tocar a musica
    loadMusic();

    showMusicPlayer(context);
  }

  Future<void> showMusicPlayer(BuildContext context) async {
    loadCurrentMusicDuration();

    showBottomSheet(
      context: context,
      builder: (_) => Obx(
        () => MusicPlayerWidget(
            music: _playlistPlaying[getCurrentMusicIndexPlaying ?? 0]),
      ),
      constraints: BoxConstraints(
        maxHeight: context.getHeight - context.getTopPadding,
      ),
      backgroundColor: Colors.transparent,
      enableDrag: true,
    );
  }
}
