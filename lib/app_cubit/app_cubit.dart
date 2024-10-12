import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_state.dart';

part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  final BuildContext context;

  AppCubit({
    required this.context,
  }) : super(
          const AppState(),
        );

  // void toggleTheme(BuildContext context) {
  //   if (state.currentThemeColor == Colors.lightBlue) {
  //     emit(state.copyWith(
  //       currentThemeColor: Colors.orange,
  //     ));
  //   }
  //   // if (state.currentThemeColor == Colors.orange) {
  //   else
  //     emit(state.copyWith(
  //       currentThemeColor: Colors.lightBlue,
  //     ));
  //   // }
  // }

  // void toggleTheme() {
  //   try {
  //     final newTheme = state.currentTheme == AppTheme.blueTheme
  //         ? AppTheme.orangeTheme
  //         : AppTheme.blueTheme;
  //     emit(
  //       state.copyWith(currentTheme: newTheme),
  //     );
  //   } catch (_) {
  //     throw Exception('cant swtich theme');
  //   }
  // }

  void logIn() {
    emit(state.copyWith(
      isLogin: true,
    ));
  }

  void setCurrentDay(int index) {
    //todo remove if not work
    emit(state.copyWith(currentDay: index));
  }

  void toggleTheme() {
    if (state.isBlueTheme) {
      emit(state.copyWith(
        // currentTheme: AppTheme.orangeTheme,
        isBlueTheme: false,
      ));
    } else {
      emit(state.copyWith(
        // currentTheme: AppTheme.blueTheme,
        isBlueTheme: true,
      ));
    }
  }
}
