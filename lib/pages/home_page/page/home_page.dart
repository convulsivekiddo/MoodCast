import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_prediction/pages/error_page/error_page.dart';
import 'package:weather_prediction/theme%20/theme.dart';
import 'package:weather_prediction/widgets/forecast_widget.dart';

import '../../../constants/constants.dart';
import '../../../models/daily_forecast.dart';
import '../../../models/weather.dart';
import '../../../repositories/weather_repository.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/progress_indicator_widget.dart';
import '../cubit/home_page_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageCubit, HomePageState>(
      listener: (context, state) async {
        if (state.status == HomePageStatus.error) {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RepositoryProvider<WeatherRepository>(
                create: (context) => WeatherRepositoryImpl(),
                child: BlocProvider<HomePageCubit>(
                  create: (context) => HomePageCubit(
                    context: context,
                  ),
                  child: const ErrorPage(),
                ),
              ),
            ),
          );
        }
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: const AppBarWidget(),
          body: _buildPageWidget(context),
        ),
      ),
    );
  }

  HomePageCubit get _cubit => context.read<HomePageCubit>();

  Widget _buildPageWidget(BuildContext context) {
    return BlocSelector<HomePageCubit, HomePageState, HomePageStatus>(
      selector: (state) => state.status,
      builder: (context, loading) {
        return loading == HomePageStatus.loading
            ? const ProgressIndicatorWidget()
            : _buildPageContentWidget(context);
      },
    );
  }

  Widget _buildPageContentWidget(BuildContext context) {
    return BlocSelector<HomePageCubit, HomePageState, Weather?>(
      selector: (state) => state.weather,
      builder: (context, weather) {
        return weather != null
            ? SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildLocationHeaderWidget(context),
                      const SizedBox(height: 5),
                      _buildTimeInfoWidget(context),
                      const SizedBox(height: 5),
                      _buildCurrentTempWidget(context),
                      const SizedBox(height: 5),
                      _buildDescriptionWidget(context),
                      const SizedBox(height: 5),
                      _buildWeatherImageWidget(context),
                      const SizedBox(height: 5),
                      _buildLaterTextWidget(context),
                      const SizedBox(height: 5),
                      _buildWeekForecastWidget(context),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }

  Widget _buildLocationHeaderWidget(BuildContext context) {
    return BlocSelector<HomePageCubit, HomePageState, String>(
      selector: (state) => state.weather!.cityName,
      builder: (context, cityName) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            cityName,
            style: AppTheme.createWhiteTextStyle(30),
          ),
        );
      },
    );
  }

  Widget _buildTimeInfoWidget(BuildContext context) {
    return BlocSelector<HomePageCubit, HomePageState, int>(
      selector: (state) => state.weather!.dt,
      builder: (context, date) {
        final dateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  DateFormat('MMM dd, yyyy').format(dateTime),
                  style: AppTheme.createWhiteTextStyle(20),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Widget _buildDescriptionWidget(BuildContext context) {
    return BlocSelector<HomePageCubit, HomePageState, String>(
      selector: (state) => state.weather!.mainCondition,
      builder: (context, description) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              description,
              style: AppTheme.createWhiteTextStyle(
                30,
                bold: true,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCurrentTempWidget(BuildContext context) {
    return BlocSelector<HomePageCubit, HomePageState, double>(
      selector: (state) => state.weather!.temperature,
      builder: (state, temperature) {
        return Text(
          "${temperature.toStringAsFixed(0)} °С",
          style: AppTheme.createWhiteTextStyle(60),
        );
      },
    );
  }

  Widget _buildWeatherImageWidget(BuildContext context) {
    return BlocSelector<HomePageCubit, HomePageState, String?>(
      selector: (state) => state.weather!.mainCondition,
      builder: (context, mainCondition) {
        return Lottie.asset(
          _cubit.getAnimation(
            mainCondition,
          ),
        );
      },
    );
  }

  Widget _buildLaterTextWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        Constants.laterWeekText,
        style: AppTheme.createWhiteTextStyle(30),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildWeekForecastWidget(BuildContext context) {
    return BlocSelector<HomePageCubit, HomePageState, List<Forecast>?>(
      selector: (state) => state.weekForecast,
      builder: (context, forecastList) {
        return ForecastWidget(
          forecastData: forecastList,
        );
      },
    );
  }
}
