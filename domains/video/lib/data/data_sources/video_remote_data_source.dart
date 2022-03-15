import 'package:dependencies/dio/dio.dart';
import 'package:video/data/models/test_dto.dart';

abstract class VideoRemoteDataSource {
  const VideoRemoteDataSource();

  Future<TestDTO> test();
}

class VideoRemoteDataSourceImpl extends VideoRemoteDataSource {
  final Dio dio;

  const VideoRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<TestDTO> test() async {
    try {
      final response = await dio.get("/albums/1");
      return TestDTO.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
