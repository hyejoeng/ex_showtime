class GenresModel {
  final int id;
  final String name;

  GenresModel({
    required this.id,
    required this.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(id: json['id'], name: json['name']);
}