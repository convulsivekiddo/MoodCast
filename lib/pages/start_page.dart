import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_prediction/app_cubit/app_cubit.dart';
import 'package:weather_prediction/widgets/bubble_button_widget.dart';
import 'package:weather_prediction/widgets/elevated_button_widget.dart';

import '../constants/constants.dart';
import '../theme /theme.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageWidget(context),
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
        bold: true,
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
    return ElevatedButtonWidget(
      onPressed: () async {
        _cubit.logIn();
      },
      buttonText: 'Start',
    );
  }
}
