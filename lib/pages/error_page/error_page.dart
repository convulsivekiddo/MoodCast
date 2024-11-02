import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_prediction/widgets/bubble_button_widget.dart';
import 'package:weather_prediction/widgets/elevated_button_widget.dart';

import '../../constants/constants.dart';
import '../../repositories/weather_repository.dart';
import '../../theme /theme.dart';
import '../home_page/cubit/home_page_cubit.dart';
import '../home_page/page/home_page.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<StatefulWidget> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: _buildPageWidget(context),
      ),
    );
  }

  Widget _buildPageWidget(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: _buildPageContentWidget(context),
        ),
      ),
    );
  }

  Widget _buildPageContentWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildImageWidget(context),
        const SizedBox(height: 10),
        _buildSorryTextWidget(context),
        const SizedBox(height: 10),
        _buildTryAgainWidget(context),
      ],
    );
  }

  Widget _buildImageWidget(BuildContext context) {
    return Center(
      child: BubbleButtonWidget(
        imagePath: Constants.cryingCloudImageUrl,
      ),
    );
  }

  Widget _buildSorryTextWidget(BuildContext context) {
    return Column(
      children: [
        Text(
          Constants.oopsText,
          style: AppTheme.createWhiteTextStyle(
            40,
            bold: true,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          Constants.errorCouldntLoadWeather,
          style: AppTheme.createWhiteTextStyle(24),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTryAgainWidget(BuildContext context) {
    return ElevatedButtonWidget(
      onPressed: () async => await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RepositoryProvider<WeatherRepository>(
            create: (context) => WeatherRepositoryImpl(),
            child: BlocProvider<HomePageCubit>(
              create: (context) => HomePageCubit(
                context: context,
              ),
              child: const HomePage(),
            ),
          ),
        ),
      ),
      buttonText: Constants.goBackAndTryAgainText,
    );
  }
}
