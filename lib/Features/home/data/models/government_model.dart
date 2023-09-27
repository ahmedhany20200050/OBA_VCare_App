class GovernmentModel {
  final int id;
  final String name;

  GovernmentModel({required this.id, required this.name});
  factory GovernmentModel.fromJson(Map<String, dynamic> json) {
    return GovernmentModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
