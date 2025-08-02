class AnnouncementsModel {
  final String title;
  final String description;

  AnnouncementsModel({
    required this.title,
    required this.description,
  });

  factory AnnouncementsModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementsModel(
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}
