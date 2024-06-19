import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planner_app/src/core/utils/constants.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState.initial());

  void signUp() {
    debugPrint(
        'name: ${state.name}\nemail: ${state.email}\npass: ${state.password}');
  }

  void onChangeName(String value) => emit(state.copyWith(name: value));

  void onChangeEmail(String value) => emit(state.copyWith(email: value));

  void onChangePassword(String value) => emit(state.copyWith(password: value));
}
