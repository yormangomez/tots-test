import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:tots/feature/auth/view/auth_desktop.dart';
import 'package:tots/feature/auth/view/auth_mobile.dart';
import 'package:tots/injection/injection_container.dart' as di;
import 'package:tots/feature/auth/bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthBloc>(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return MediaQuery.of(context).size.width > 900
                  ? const AuthDesktop()
                  : const AuthMobile();
            },
          );
        },
      ),
    );
  }
}
