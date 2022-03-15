import 'package:video/data/data_sources/video_remote_data_source.dart';
import 'package:video/data/mappers/video_mapper.dart';
import 'package:video/domain/repositories/video_repository.dart';
import 'package:video/domain/entities/test_entity.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:common/utils/error/failure_response.dart';

class VideoRepositoryImpl extends VideoRepository {
  final VideoRemoteDataSource remoteDataSource;
  final VideoMapper videoMapper;

  const VideoRepositoryImpl({
    required this.remoteDataSource,
    required this.videoMapper,
  });

  @override
  Future<Either<FailureResponse, TestEntity>> test() async {
    try {
      final response = await remoteDataSource.test();
      return Right(videoMapper.mapTestDTOtoEntity(response));
    } on Exception catch (error) {
      return Left(FailureResponse(errorMessage: error.toString()));
    }
  }
}
