import 'package:dependencies/get_it/get_it.dart';
import 'package:video/data/data_sources/video_remote_data_source.dart';
import 'package:video/data/mappers/video_mapper.dart';
import 'package:video/data/repositories/video_repository_impl.dart';
import 'package:video/domain/repositories/video_repository.dart';
import 'package:video/domain/usecases/get_video_usecase.dart';

class RegisterVideoModule {
  RegisterVideoModule() {
    _registerMapper();
    _registerCore();
  }

  void _registerMapper() {
    sl.registerLazySingleton<VideoMapper>(() => const VideoMapper());
  }

  void _registerCore() {
    /// remote
    sl.registerLazySingleton<VideoRemoteDataSource>(
        () => VideoRemoteDataSourceImpl(
              dio: sl(),
            ));

    /// repository
    sl.registerLazySingleton<VideoRepository>(() => VideoRepositoryImpl(
          remoteDataSource: sl(),
          videoMapper: sl(),
        ));

    /// use case
    sl.registerLazySingleton<GetVideoUseCase>(() => GetVideoUseCase(
          repository: sl(),
        ));
  }
}
