// import 'package:flutter/material.dart';
//
// import '../constants/constants.dart';
//
// abstract class SnackBarWidget {
//   static void showSuccess({
//     required BuildContext context,
//     String? title,
//     String? contentText,
//     Duration duration = const Duration(seconds: 5),
//   }) async {
//     return show(
//       context: context,
//       title: title ?? Constants.successText,
//       contentText: contentText,
//       backgroundColor: Colors.greenAccent,
//       icon: Icons.check_circle_outline_rounded,
//       duration: duration,
//     );
//   }
//
//   static void showInvalidForm({
//     required BuildContext context,
//     Duration duration = const Duration(seconds: 3),
//   }) {
//     return show(
//       context: context,
//       title: Constants.correctFormText,
//       contentText: Constants.correctFormText,
//     );
//   }
//
//   static void showError({
//     required BuildContext context,
//     String? title,
//     String? text,
//     Duration duration = const Duration(seconds: 5),
//     Color backgroundColor = Colors.red,
//   }) async {
//     return show(
//       context: context,
//       title: title ?? Constants.errorText,
//       contentText: text,
//       backgroundColor: backgroundColor,
//       icon: Icons.error_outline_rounded,
//       duration: duration,
//     );
//   }
//
//   // static Future<void> showWithErrorObject({
//   //   required BuildContext context,
//   //   required Error error,
//   //   Duration duration = const Duration(seconds: 5),
//   // }) async {
//   //   final resultDuration =
//   //       error.message.length > 100 ? const Duration(seconds: 10) : duration;
//   //
//   //   return show(
//   //     context: context,
//   //     title: error.title,
//   //     contentText: error.message,
//   //     backgroundColor: error.color,
//   //     icon: Icons.error_outline_rounded,
//   //     duration: resultDuration,
//   //   );
//   // }
//
//   static void showWithTimer({
//     required BuildContext context,
//     required VoidCallback onCompleted,
//     required VoidCallback onPressed,
//     required String buttonTitle,
//     String? title,
//     String? text,
//     Duration duration = const Duration(seconds: 10),
//   }) {
//     final isTitleExisted = title != null && title.isNotEmpty;
//     final isTextExisted = text != null && text.isNotEmpty;
//
//     final snackBar = SnackBar(
//       duration: const Duration(minutes: 10),
//       backgroundColor: Colors.grey,
//       behavior: SnackBarBehavior.floating,
//       margin: EdgeInsets.only(
//         bottom: 20,
//         left: 50,
//         right: 50,
//       ),
//       padding: EdgeInsets.symmetric(
//         vertical: 1.5.h,
//         horizontal: 0.75.fs,
//       ),
//       shape: RoundedRectangleBorder( todo remove
//         borderRadius: BorderRadius.all(Radius.circular(1.fs)),
//       ),
//       elevation: 5,
//       content: Row(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               border: Border.all(
//                 color: AppColors.white,
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(1.fs),
//               ),
//             ),
//             width: 1.w,
//             height: 8.h,
//           ),
//           SizedBox(width: 2.5.w),
//           Container(
//             height: 2.25.fs,
//             width: 2.25.fs,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: AppColors.white,
//                 width: 0.1.fs,
//               ),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(5.fs),
//               ),
//             ),
//             child: CountDownTimerWidget(
//               duration: duration,
//               onCompleted: onCompleted,
//             ),
//           ),
//           SizedBox(width: 2.5.w),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 isTitleExisted
//                     ? TextWidget(
//                         title,
//                         style: Theme.of(context).textTheme.titleSmall?.copyWith(
//                               color: AppColors.white,
//                             ),
//                       )
//                     : const SizedBox.shrink(),
//                 if (isTitleExisted && isTextExisted) SizedBox(height: 0.25.h),
//                 isTextExisted
//                     ? Padding(
//                         padding: EdgeInsets.only(top: 0.25.h),
//                         child: TextWidget(
//                           text,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium
//                               ?.copyWith(color: AppColors.white),
//                         ),
//                       )
//                     : const SizedBox.shrink(),
//               ],
//             ),
//           ),
//           TextButtonWidget(
//             onPressed: onPressed,
//             title: buttonTitle,
//             style: Theme.of(context).textTheme.titleSmall?.copyWith(
//                   color: AppColors.white,
//                 ),
//           ),
//         ],
//       ),
//     );
//
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//
//   static void show({
//     required BuildContext context,
//     String? title,
//     String? contentText,
//     IconData icon = Icons.info_outline_rounded,
//     Color backgroundColor = AppColors.blueLight,
//     Duration duration = const Duration(seconds: 5),
//   }) {
//     final isTitleExisted = title != null && title.isNotEmpty;
//     final isTextExisted = contentText != null && contentText.isNotEmpty;
//
//     final snackBar = SnackBar(
//       duration: duration,
//       backgroundColor: AppColors.snackBarBackground,
//       behavior: SnackBarBehavior.floating,
//       margin: EdgeInsets.only(
//         bottom: 1.h,
//         left: 2.5.w,
//         right: 2.5.w,
//       ),
//       padding: EdgeInsets.symmetric(
//         vertical: 1.5.h,
//         horizontal: 0.75.fs,
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(1.fs)),
//       ),
//       elevation: 5,
//       content: IntrinsicHeight(
//         child: Row(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: backgroundColor,
//                 border: Border.all(
//                   color: backgroundColor,
//                   width: 2,
//                 ),
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(1.fs),
//                 ),
//               ),
//               width: 1.w,
//             ),
//             SizedBox(
//               width: isTextExisted ? 2.5.w : 5.w,
//             ),
//             Icon(
//               icon,
//               size: 2.25.fs,
//               color: backgroundColor,
//             ),
//             SizedBox(
//               width: isTextExisted ? 2.5.w : 5.w,
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   isTitleExisted
//                       ? TextWidget(
//                           title,
//                           style:
//                               Theme.of(context).textTheme.titleSmall?.copyWith(
//                                     color: AppColors.white,
//                                   ),
//                         )
//                       : const SizedBox.shrink(),
//                   if (isTitleExisted && isTextExisted) SizedBox(height: 0.25.h),
//                   if (isTextExisted)
//                     Padding(
//                       padding: EdgeInsets.only(top: 0.25.h),
//                       child: TextWidget(
//                         contentText,
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyMedium
//                             ?.copyWith(color: AppColors.white),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }

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
                    isBold: true,
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
