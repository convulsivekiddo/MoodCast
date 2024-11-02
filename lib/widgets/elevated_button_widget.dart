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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.5,
          maxWidth: MediaQuery.of(context).size.width * 0.8,
          minHeight: 50,
        ),
        child: Center(
          child: isLoading
              ? const ProgressIndicatorWidget(
                  size: 20,
                  strokeWidth: 1,
                )
              : FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    buttonText,
                    style: AppTheme.createWhiteTextStyle(
                      20,
                      bold: true,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
        ),
      ),
    );
  }
}
