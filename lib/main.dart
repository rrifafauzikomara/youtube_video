import 'package:common/utils/constant/named_routes.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_video/di/injections.dart';
import 'package:home/presentation/bloc/bloc.dart';
import 'package:home/presentation/ui/home_screen.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: NamedRoutes.homeScreen,
      routes: {
        NamedRoutes.homeScreen: (context) => BlocProvider(
              create: (context) => HomeBloc(
                getVideoUseCase: sl(),
              ),
              child: const HomeScreen(),
            ),
      },
    );
  }
}
