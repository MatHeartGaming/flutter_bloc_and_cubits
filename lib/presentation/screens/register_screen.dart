import 'package:blocs_and_cubits/config/constants/regular_expressions.dart';
import 'package:blocs_and_cubits/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const name = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo usuario"),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100,
              ),
              SizedBox(
                height: 30,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String userName = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              onChanged: (value) => userName = value,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Campo requerido';
                }
                if (value.length < 6) return 'Insertar mas de 6 letras';
                return null;
              },
              label: "Nombre de usuario",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              onChanged: (value) => email = value,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Campo requerido';
                }
                if (!emailRegExp.hasMatch(value)) return 'No es un correo valido';
                return null;
              },
              label: "Correo electronico",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              onChanged: (value) => password = value,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Campo requerido';
                }
                if (value.length < 6) return 'Insertar mas de 6 letras';
                return null;
              },
              label: "Contrasena",
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                final isValid = _formKey.currentState?.validate() ?? false;
                if (!isValid) return;
              },
              icon: const Icon(Icons.save),
              label: const Text("Crear usuario"),
            ),
          ],
        ));
  }
}
