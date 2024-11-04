// ignore_for_file: cast_nullable_to_non_nullable

part of 'router_config.dart';

Widget _loginHandler(BuildContext context, GoRouterState state) {
  return const AuthPage();
}

Widget _homeHandler(BuildContext context, GoRouterState state, Widget child) {
  return HomePage(
    child: child,
  );
}

Widget _mainDashboardPageHandler(
  BuildContext context,
  GoRouterState state,
) {
  return const MainDashboardPage();
}

Page<Widget> _profileHandler(
  BuildContext context,
  GoRouterState state,
) {
  return const NoTransitionPage(child: ResponsiveProfileScreen());
}
