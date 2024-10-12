import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_prediction/app_cubit/app_cubit.dart';
import 'package:weather_prediction/widgets/bubble_button_widget.dart';
import 'package:weather_prediction/widgets/elevated_button_widget.dart';

import '../constants/constants.dart';
import '../home_page/cubit/home_page_cubit.dart';
import '../home_page/page/home_page.dart';
import '../repositories/weather_repository.dart';
import '../theme /theme.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listener: (context, state) {
        // if (state.error != null) {
        //   SnackBarWidget.show(
        //     context,
        //     "Cant navigate",
        //   );
        // }
      },
      child: Scaffold(
        body: _buildPageWidget(context),
      ),
    );
  }

  AppCubit get _cubit => context.read<AppCubit>();

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
        _buildWelcomeWidget(context),
        const SizedBox(height: 10),
        _buildDescriptionWidget(context),
        const SizedBox(height: 10),
        _buildStartButton(context),
      ],
    );
  }

  Widget _buildImageWidget(BuildContext context) {
    return Center(
      child: BubbleButtonWidget(
        imagePath: Constants.rainbowImageUrl,
      ),
    );
  }

  Widget _buildWelcomeWidget(BuildContext context) {
    return Text(
      Constants.welcomeText,
      style: AppTheme.createWhiteTextStyle(
        40,
        isBold: true,
      ),
    );
  }

  Widget _buildDescriptionWidget(BuildContext context) {
    return Text(
      Constants.startPageText,
      style: AppTheme.createWhiteTextStyle(24),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildStartButton(BuildContext context) {
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
      onPressed: () async {
        _cubit.logIn();
        // await Navigator.of(context).push( todo remove
        //   MaterialPageRoute(
        //     builder: (context) => RepositoryProvider<WeatherRepository>(
        //       create: (context) => WeatherRepositoryImpl(),
        //       child: BlocProvider<HomePageCubit>(
        //         create: (context) => HomePageCubit(
        //           context: context,
        //           receivedWeather: null,
        //         ),
        //         child: const HomePage(),
        //       ),
        //     ),
        //   ),
        // );
      },
      buttonText: 'Start',
    );
  }
}
