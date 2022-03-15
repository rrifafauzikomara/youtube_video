class TestDTO {
  TestDTO({
    required this.userId,
    required this.id,
    required this.title,
  });

  final int? userId;
  final int? id;
  final String? title;

  factory TestDTO.fromJson(Map<String, dynamic> json) => TestDTO(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );
}
