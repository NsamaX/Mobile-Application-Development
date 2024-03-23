class Anime {
  final String title;
  final String posterImage;
  final String synopsis;
  final String description;

  Anime({
    required this.title,
    required this.posterImage,
    required this.synopsis,
    required this.description,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      title: json['attributes']['canonicalTitle'],
      posterImage: json['attributes']['posterImage']['original'],
      synopsis: json['attributes']['synopsis'],
      description: json['attributes']['description'],
    );
  }
}
