import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_prediction/app_cubit/app_cubit.dart';
import 'package:weather_prediction/pages/home_page/cubit/home_page_cubit.dart';
import 'package:weather_prediction/pages/home_page/page/home_page.dart';
import 'package:weather_prediction/pages/start_page/start_page.dart';
import 'package:weather_prediction/repositories/weather_repository.dart';
import 'package:weather_prediction/theme%20/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppCubit(context: context),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                state.isBlueTheme ? AppTheme.blueTheme : AppTheme.orangeTheme,
            home: state.isLogin
                ? RepositoryProvider<WeatherRepository>(
                    create: (context) => WeatherRepositoryImpl(),
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider<HomePageCubit>(
                          create: (context) => HomePageCubit(
                            context: context,
                          ),
                        ),
                      ],
                      child: const HomePage(),
                    ),
                  )
                : const StartingPage(),
          );
        },
      ),
    );
  }
}
