import 'package:blocs_and_cubits/config/constants/regular_expressions.dart';
import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { format, length }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmailError.length) return 'Minimo 6 caracteres';
    if (displayError == EmailError.format) return 'El correo no es valido';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if (value.trim().length < 6) return EmailError.length;
    if (!emailRegExp.hasMatch(value)) return EmailError.format;
    return null;
  }
}
