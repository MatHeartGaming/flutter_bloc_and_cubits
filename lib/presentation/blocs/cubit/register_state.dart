part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus status;
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;

  const RegisterFormState(
      {this.status = FormStatus.invalid,
      this.isValid = false,
      this.username = const Username.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  copyWith({
    FormStatus? status,
    bool? isValid,
    Username? username,
    Email? email,
    Password? password,
  }) =>
      RegisterFormState(
        status: status ?? this.status,
        isValid: isValid ?? this.isValid,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [username, isValid, email, password, status];
}
