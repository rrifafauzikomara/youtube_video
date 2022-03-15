import 'package:dependencies/dio/dio.dart';

import 'package:video/data/models/youtube_video_dto.dart';
import 'package:common/utils/constant/api_constant.dart';

abstract class VideoRemoteDataSource {
  const VideoRemoteDataSource();

  Future<YouTubeVideoDTO> searchVideo(String query);
}

class VideoRemoteDataSourceImpl extends VideoRemoteDataSource {
  final Dio dio;

  const VideoRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<YouTubeVideoDTO> searchVideo(String query) async {
    try {
      final params = {
        'part': 'snippet',
        'channelId': ApiConstant.channelId,
        'maxResults': 10,
        'q': query,
        'key': ApiConstant.apiKey,
      };

      final response = await dio.get(
        ApiConstant.baseUrl + 'search?',
        queryParameters: params,
      );
      return YouTubeVideoDTO.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
