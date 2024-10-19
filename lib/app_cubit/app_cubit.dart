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

  void logIn() {
    emit(state.copyWith(
      isLogin: true,
    ));
  }

  void toggleTheme() {
    if (state.isBlueTheme) {
      emit(state.copyWith(
        isBlueTheme: false,
      ));
    } else {
      emit(state.copyWith(
        isBlueTheme: true,
      ));
    }
  }
}
