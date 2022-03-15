import 'package:equatable/equatable.dart';
import 'package:video/domain/entities/test_entity.dart';
import 'package:common/utils/state/view_data_state.dart';

class HomeState extends Equatable {
  final ViewData<TestEntity> statusTest;

  const HomeState({
    required this.statusTest,
  });

  HomeState copyWith({
    ViewData<TestEntity>? statusTest,
  }) {
    return HomeState(
      statusTest: statusTest ?? this.statusTest,
    );
  }

  @override
  List<Object?> get props => [statusTest];
}
