import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:video/domain/entities/test_entity.dart';
import 'package:video/domain/repositories/video_repository.dart';

class GetVideoUseCase extends UseCase<TestEntity, NoParams> {
  final VideoRepository repository;

  const GetVideoUseCase({required this.repository});

  @override
  Future<Either<FailureResponse, TestEntity>> call(NoParams params) async {
    return await repository.test();
  }
}
