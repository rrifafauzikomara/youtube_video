import 'package:dependencies/equatable/equatable.dart';

class FailureResponse extends Equatable {
  final String errorMessage;

  const FailureResponse({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
