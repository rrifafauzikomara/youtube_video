import 'package:common/utils/arguments/detail_you_tube_video_argument.dart';
import 'package:resources/constant/named_routes.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_video/di/injections.dart';
import 'package:home/presentation/bloc/bloc.dart';
import 'package:home/presentation/ui/home_screen.dart';
import 'package:in_video_content/presentation/ui/detail_you_tube_video_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injections().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube API Example',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: NamedRoutes.homeScreen,
      routes: {
        NamedRoutes.homeScreen: (context) => BlocProvider(
              create: (context) => HomeBloc(
                getVideoUseCase: sl(),
              ),
              child: const HomeScreen(),
            ),
        NamedRoutes.detailYouTubeVideoScreen: (context) =>
            DetailYouTubeVideoScreen(
              argument: ModalRoute.of(context)!.settings.arguments
                  as DetailYouTubeVideoArgument,
            ),
      },
    );
  }
}
