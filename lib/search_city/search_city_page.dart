import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_prediction/home_page/cubit/home_page_cubit.dart';
import 'package:weather_prediction/home_page/page/home_page.dart';
import 'package:weather_prediction/search_city/cubit%20/search_city_cubit.dart';
import 'package:weather_prediction/theme%20/theme.dart';
import 'package:weather_prediction/widgets/elevated_button_widget.dart';

import '../constants/constants.dart';
import '../repositories/weather_repository.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/progress_indicator_widget.dart';
import '../widgets/snack_bar_widget.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCityCubit, SearchCityState>(
      listener: (context, state) async {
        if (state.error != null) {
          SnackBarWidget.show(
            context,
            Constants.errorCityNotFoundText,
          );
        }
        if (state.status == SearchCityStatus.success) {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RepositoryProvider<WeatherRepository>(
                create: (context) => WeatherRepositoryImpl(),
                child: BlocProvider<HomePageCubit>(
                  create: (context) => HomePageCubit(
                    context: context,
                    receivedWeather: state.weather,
                    receivedForecast: state.forecast,
                  ),
                  child: const HomePage(),
                ),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: _buildPageContentWidget(context),
      ),
    );
  }

  SearchCityCubit get _cubit => context.read<SearchCityCubit>();

  Widget _buildPageContentWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTextFieldWidget(context),
        const SizedBox(height: 25),
        _buildSeeWeatherButton(context),
      ],
    );
  }

  Widget _buildTextFieldWidget(BuildContext context) {
    return BlocSelector<SearchCityCubit, SearchCityState,
        TextEditingController>(
      selector: (state) => state.controller,
      builder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: TextField(
            style: const TextStyle(
              color: Colors.black,
            ),
            controller: controller,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: Constants.enterTheCityNameText,
              suffixIcon: IconButton(
                onPressed: controller.clear,
                icon: const Icon(
                  Icons.clear,
                ),
              ),
              prefixIcon: const Icon(
                Icons.search,
                size: 40.0,
              ),
            ),
          ),
        );
      },
    );
  }

  _buildSeeWeatherButton(BuildContext context) {
    return BlocSelector<SearchCityCubit, SearchCityState, bool>(
      selector: (state) => state.status == SearchCityStatus.loading,
      builder: (context, loading) {
        // return ElevatedButton(
        //   onPressed: () {
        //     _cubit.getWeatherByCityName();
        //   },
        //   child: SizedBox(
        //     width: MediaQuery.sizeOf(context).width * 0.5,
        //     height: 50,
        //     child: Center(
        //       child: loading
        //           ? const ProgressIndicatorWidget(size: 20)
        //           : Text(
        //               Constants.seeWeatherText,
        //               style: AppTheme.createWhiteTextStyle(
        //                 20,
        //                 isBold: true,
        //               ),
        //             ),
        //     ),
        //   ),
        // );

        return ElevatedButtonWidget(
          isLoading: loading,
          onPressed: () {
            _cubit.getWeatherByCityName();
          },
          buttonText: Constants.seeWeatherText,
        );
      },
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_prediction/home_page/cubit/home_page_cubit.dart';
import 'package:weather_prediction/theme%20/theme.dart';

import '../constants/constants.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/snack_bar_widget.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageCubit, HomePageState>(
      listener: (context, state) {
        if (state.error != null) {
          SnackBarWidget.show(context);
        }
        // if (state.status == HomePageStatus.success) {
        //   Navigator.pop(context);
        // }
      },
      child: Scaffold(
        appBar: const AppBarWidget(),
        body: _buildPageContentWidget(context),
      ),
    );
  }

  HomePageCubit get _cubit => context.read<HomePageCubit>();

  Widget _buildPageContentWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTextFieldWidget(context),
        const SizedBox(height: 5),
        _buildSeeWeatherButton(context),
      ],
    );
  }

  Widget _buildTextFieldWidget(BuildContext context) {
    return BlocSelector<HomePageCubit, HomePageState, TextEditingController>(
      selector: (state) => state.controller,
      builder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: TextField(
            style: const TextStyle(
              color: Colors.black,
            ),
            controller: controller,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: Constants.enterTheCityNameText,
              suffixIcon: IconButton(
                onPressed: controller.clear,
                icon: const Icon(
                  Icons.clear,
                ),
              ),
              prefixIcon: const Icon(
                Icons.search,
                size: 40.0,
              ),
            ),
          ),
        );
      },
    );
  }

  _buildSeeWeatherButton(BuildContext context) {
    return BlocSelector<HomePageCubit, HomePageState, bool>(
      selector: (state) => state.status == HomePageStatus.loading,
      builder: (context, loading) {
        return ElevatedButton(
          onPressed: () {
            _cubit.getWeatherByCityName();
          },
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.5,
            height: 50,
            child: Center(
              child: loading
                  ? const CircularProgressIndicator() // todo
                  : Text(
                      Constants.seeWeatherText,
                      style: AppTheme.createWhiteTextStyle(
                        20,
                        isBold: true,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}

 */
