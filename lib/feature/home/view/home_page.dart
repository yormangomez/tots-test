// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tots/feature/home/view/home_desktop.dart';
import 'package:tots/feature/home/view/home_mobile.dart';
import 'package:tots/feature/main_dashboard/bloc/client_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ClientBloc>().add(const GetClientEvent());
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      disableBarrierInteraction: true,
      scrollDuration: const Duration(milliseconds: 5),
      disableMovingAnimation: true,
      enableAutoScroll: MediaQuery.of(context).size.height >= 700,
      builder: (_) => HomeView(
        child: widget.child,
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: LayoutBuilder(
        builder: (context, constraints) {
          return MediaQuery.of(context).size.width > 900
              ? HomeDesktop(
                  child: child,
                )
              : HomeMobile(
                  child: child,
                );
        },
      ),
    );
  }
}
