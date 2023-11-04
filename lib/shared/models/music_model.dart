class MusicModel {
  // Imagem da musica
  final String? img;
  // Titulo da musica
  final String title;
  // A url da musica (o caminho para execultarmos a musica)
  final String url;
  // A durção da musica
  final int duration;

  MusicModel({
    this.img,
    required this.title,
    required this.url,
    required this.duration,
  });

  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
      img: map['img'],
      title: map['title'] ?? '',
      url: map['path'] ?? '',
      duration: map['duration'] ?? 0,
    );
  }
}
