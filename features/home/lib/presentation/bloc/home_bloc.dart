import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:home/presentation/bloc/bloc.dart';
import 'package:video/domain/entities/test_entity.dart';
import 'package:video/domain/usecases/get_video_usecase.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetVideoUseCase getVideoUseCase;

  HomeBloc({
    required this.getVideoUseCase,
  }) : super(HomeState(statusTest: ViewData.initial()));

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is TestEvent) {
      yield* _getPortfolio();
    }
  }

  Stream<HomeState> _getPortfolio() async* {
    yield state.copyWith(statusTest: ViewData.loading(message: 'Loading'));

    final response = await getVideoUseCase.call(const NoParams());

    yield* response.fold(_onFailurePortfolio, _onSuccessPortfolio);
  }

  Stream<HomeState> _onFailurePortfolio(FailureResponse failure) async* {
    yield state.copyWith(
        statusTest: ViewData.error(
      message: failure.errorMessage,
      failure: failure,
    ));
  }

  Stream<HomeState> _onSuccessPortfolio(
    TestEntity? data,
  ) async* {
    yield state.copyWith(statusTest: ViewData.loaded(data: data));
  }
}
