import 'package:flutter/material.dart';
import 'package:weather_prediction/theme%20/theme.dart';

class SnackBarWidget {
  static void show(
    BuildContext context,
    String message,
  ) {
    final snackBar = SnackBar(
      duration: const Duration(
        seconds: 5,
      ),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 30,
        right: 30,
      ),
      content: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
            const Icon(
              Icons.error,
              size: 25,
            ),
            // const SizedBox(width: 10),
            Expanded(
              child: Center(
                child: Text(
                  message, // Display the error message
                  style: AppTheme.createWhiteTextStyle(
                    20,
                    bold: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
