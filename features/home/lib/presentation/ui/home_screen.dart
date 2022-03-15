import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _getVideo(BuildContext context) {
    context.read<HomeBloc>().add(const SearchVideo(query: 'ruangguru'));
  }

  @override
  void initState() {
    super.initState();
    _getVideo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final status = state.statusYouTubeVideo.status;
            if (status.isLoading) {
              return const CircularProgressIndicator();
            } else if (status.isError) {
              return Text(state.statusYouTubeVideo.message);
            } else if (status.isNoData) {
              return const Text('No Data');
            } else if (status.isHasData) {
              return Text(
                  '${state.statusYouTubeVideo.data?.items.length ?? 0}');
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
