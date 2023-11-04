class GenreModel {
  // Imagem do genero musical
  final String? img;
  // Titulo do genero musical
  final String title;
  // Nome do genero para consumirmos a API e pegar os detalhes
  final String searchString;

  GenreModel({
    this.img,
    required this.title,
    required this.searchString,
  });

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      img: map['img'],
      title: map['title'] ?? '',
      searchString: map["searchString"] ?? '',
    );
  }
}
