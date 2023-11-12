import 'package:blocs_and_cubits/infrastructure/inputs/inputs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(state.copyWith(
      status: FormStatus.validating,
      username: Username.dirty(state.username.value),
      password: Password.dirty(state.password.value),
      isValid: Formz.validate([state.username, state.password, state.email]),
    ));
  }

  void usernameStringChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(
      username: username,
      isValid: Formz.validate([username, state.password, state.email]),
    ));
  }

  void usernameChanged(Username username) {
    emit(state.copyWith(
      username: username,
      isValid: Formz.validate([username, state.password, state.email]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.username, state.password]),
    ));
  }

  void passwordStringChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.username, state.email]),
    ));
  }

  void passwordChanged(Password password) {
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.username, state.email]),
    ));
  }
}
