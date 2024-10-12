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
            title: 'Flutter Demo',
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

    // return BlocProvider(
    //   create: (_) => AppCubit(context: context),
    //   child: BlocSelector<AppCubit, AppState, bool>(
    //     selector: (state) => state.isBlueTheme,
    //     builder: (context, theme) {
    //       return MaterialApp(
    //         routes: <String, WidgetBuilder>{
    //           'home_page': (BuildContext context) => const HomePage(),
    //           'search_city_page': (BuildContext context) =>
    //               const SearchCityPage(),
    //         },
    //         debugShowCheckedModeBanner: false,
    //         title: 'Flutter Demo',
    //         theme: theme ? AppTheme.blueTheme : AppTheme.orangeTheme,
    //         home: RepositoryProvider<WeatherRepository>(
    //           create: (context) => WeatherRepositoryImpl(),
    //           child: MultiBlocProvider(
    //             providers: [
    //               BlocProvider<HomePageCubit>(
    //                 create: (context) => HomePageCubit(
    //                   receivedWeather: null,
    //                   context: context,
    //                 ),
    //               ),
    //             ],
    //             child: const HomePage(),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
