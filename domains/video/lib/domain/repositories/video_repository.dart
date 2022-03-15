import 'package:dependencies/dartz/dartz.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:video/domain/entities/youtube_video_entity.dart';

abstract class VideoRepository {
  const VideoRepository();

  Future<Either<FailureResponse, YouTubeVideoEntity>> searchVideo(String query);
}
