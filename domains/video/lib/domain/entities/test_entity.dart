import 'package:dependencies/equatable/equatable.dart';

class TestEntity extends Equatable {
  const TestEntity({
    required this.userId,
    required this.id,
    required this.title,
  });

  final int userId;
  final int id;
  final String title;

  @override
  List<Object?> get props => [userId, id, title];
}
