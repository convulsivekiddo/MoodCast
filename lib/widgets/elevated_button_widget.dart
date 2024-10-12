import 'package:flutter/material.dart';
import 'package:weather_prediction/widgets/progress_indicator_widget.dart';

import '../theme /theme.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final bool isLoading;

  const ElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 50,
        child: Center(
          child: isLoading
              ? const ProgressIndicatorWidget(
                  size: 20,
                  strokeWidth: 1,
                )
              : Text(
                  buttonText,
                  style: AppTheme.createWhiteTextStyle(
                    20,
                    isBold: true,
                  ),
                ),
        ),
      ),
    );
  }
}
