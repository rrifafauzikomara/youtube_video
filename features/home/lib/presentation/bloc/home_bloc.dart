import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:home/presentation/bloc/bloc.dart';
import 'package:video/domain/entities/youtube_video_entity.dart';
import 'package:video/domain/usecases/get_video_usecase.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetVideoUseCase getVideoUseCase;

  HomeBloc({
    required this.getVideoUseCase,
  }) : super(HomeState(statusYouTubeVideo: ViewData.initial()));

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is SearchVideo) {
      yield* _searchVideo(event.query);
    }
  }

  Stream<HomeState> _searchVideo(String query) async* {
    yield state.copyWith(
        statusYouTubeVideo: ViewData.loading(message: 'Loading'));

    final response = await getVideoUseCase.call(query);

    yield* response.fold(_onFailure, _onSuccess);
  }

  Stream<HomeState> _onFailure(FailureResponse failure) async* {
    yield state.copyWith(
        statusYouTubeVideo: ViewData.error(
      message: failure.errorMessage,
      failure: failure,
    ));
  }

  Stream<HomeState> _onSuccess(
    YouTubeVideoEntity? data,
  ) async* {
    yield state.copyWith(statusYouTubeVideo: ViewData.loaded(data: data));
  }
}
