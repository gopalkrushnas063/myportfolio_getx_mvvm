// model/home_model.dart
class HomeModel {
  final String image;
  final String name;
  final String careerObjective;
  final String resumeUrl;

  HomeModel({
    required this.image,
    required this.name,
    required this.careerObjective,
    required this.resumeUrl,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      image: json['image'],
      name: json['name'],
      careerObjective: json['carrer_objective'], // Typo in API, should be career_objective
      resumeUrl: json['resume_url'],
    );
  }
}
