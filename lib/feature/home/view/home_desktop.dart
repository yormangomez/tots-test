import 'package:flutter/material.dart';
import 'package:tots_ui/tots_ui.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Expanded(
        child: widget.child,
      ),
    );
  }
}
