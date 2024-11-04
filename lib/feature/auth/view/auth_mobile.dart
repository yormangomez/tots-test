import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tots/feature/auth/bloc/auth_bloc.dart';
import 'package:tots/feature/auth/widget/sign_in_widget.dart';

class AuthMobile extends StatelessWidget {
  const AuthMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return const SignInWidget();
      },
    );
  }
}
