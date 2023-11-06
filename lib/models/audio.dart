class AudioModel {
  final String title;
  final String author;
  final String image;
  final Duration total;
  final String lyrics;

  const AudioModel({required this.title, required this.author, required this.image, required this.total, required this.lyrics});

  factory AudioModel.fromJSON(Map<String, dynamic> json) {
    String title = json['title'];
    String author = json['author'];
    String image = json['image'];
    Duration total = json['total'];
    String lyrics = json['lyrics'];

    return AudioModel(title: title, author: author, image: image, total: total, lyrics: lyrics);
  }
}