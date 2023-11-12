import 'package:blocs_and_cubits/presentation/blocs/cubit/register_cubit.dart';
import 'package:blocs_and_cubits/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  static const name = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo usuario"),
      ),
      body: BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
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

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  //final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;
    return Form(
        //key: _formKey,
        child: Column(
      children: [
        CustomTextFormField(
          icon: Icons.person,
          onChanged: registerCubit.usernameStringChanged,
          errorMessage: username.errorMessage,
          label: "Nombre de usuario",
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          icon: Icons.email_outlined,
          errorMessage: email.errorMessage,
          onChanged: (value) {
            registerCubit.emailChanged(value);
          },
          label: "Correo electronico",
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          icon: Icons.password_rounded,
          onChanged: registerCubit.passwordStringChanged,
          errorMessage: password.errorMessage,
          label: "Contraseña",
          obscureText: true,
        ),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
          onPressed: () {
            //final isValid = _formKey.currentState?.validate() ?? false;
            //if (!isValid) return;
            registerCubit.onSubmit();
          },
          icon: const Icon(Icons.save),
          label: const Text("Crear usuario"),
        ),
      ],
    ));
  }
}
