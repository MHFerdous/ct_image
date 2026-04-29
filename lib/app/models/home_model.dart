class HomeModel {
  final String date;
  final String title;
  final String explanation;
  final String url;
  final String? hdurl;
  final String mediaType;

  const HomeModel({
    required this.date,
    required this.title,
    required this.explanation,
    required this.url,
    this.hdurl,
    required this.mediaType,
  });

  bool get isImage => mediaType == 'image';

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      date: json['date'] as String,
      title: json['title'] as String,
      explanation: json['explanation'] as String,
      url: json['url'] as String,
      hdurl: json['hdurl'] as String?,
      mediaType: json['media_type'] as String,
    );
  }
}
