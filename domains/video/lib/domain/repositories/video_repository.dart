import 'package:video/domain/entities/test_entity.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:common/utils/error/failure_response.dart';

abstract class VideoRepository {
  const VideoRepository();

  Future<Either<FailureResponse, TestEntity>> test();
}
