import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_prediction/app_cubit/app_cubit.dart';
import 'package:weather_prediction/home_page/cubit/home_page_cubit.dart';
import 'package:weather_prediction/home_page/page/home_page.dart';
import 'package:weather_prediction/pages/start_page.dart';
import 'package:weather_prediction/repositories/weather_repository.dart';
import 'package:weather_prediction/search_city/search_city_page.dart';
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
            routes: <String, WidgetBuilder>{
              'home_page': (BuildContext context) => const HomePage(),
              'search_city_page': (BuildContext context) =>
                  const SearchCityPage(),
            },
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
                            receivedWeather: null,
                            context: context,
                            receivedForecast: null,
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
