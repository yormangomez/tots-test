// import 'package:api_helper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tots/app/routes/routes_names.dart';
import 'package:tots/core/database/login_store.dart';
import 'package:tots/feature/auth/view/auth_page.dart';
import 'package:tots/feature/home/view/home_page.dart';
import 'package:tots/feature/main_dashboard/view/main_dashboard_page.dart';
import 'package:tots/feature/profile/view/profile.dart';
import 'package:tots_ui/tots_ui.dart';

part 'router_handlers.dart';

/// The `healthNavigatorKey` is a global key that is used to access the
/// management navigator.
final GlobalKey<NavigatorState> healthNavigatorKey =
    GlobalKey<NavigatorState>();

/// The `homeNavigatorKey` is a global key that is used to access the
/// home navigator.
final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();

/// The `managementNavigatorKey` is a global key that is used to access the
/// management navigator.
final GlobalKey<NavigatorState> managementNavigatorKey =
    GlobalKey<NavigatorState>();

/// The `rootNavigatorKey` is a global key that is used to access the
/// root navigator.
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

/// The `rootScaffoldMessengerKey` is a global key that is used to access the
/// rootScaffold navigator.
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

/// Insert in this array all the routes that need to be accessible without login.
final routingExceptions = [
  RoutesNames.credential,
];

/// {@template custom_router_config}
/// The `CustomRouterConfig` class is a Dart class that represents the
/// application's custom router configuration.
/// {@endtemplate}
class CustomRouterConfig {
  /// The code is creating an instance of the `GoRouter`
  /// class and configuring its routes.
  static final _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: RoutesNames.login,
    observers: [
      // if (!kIsWeb) DynatraceNavigationObserver(),
    ],
    redirect: (context, state) {
      if (LoginStore.instance.accessToken.isNotEmpty &&
          !routingExceptions.contains(state.matchedLocation)) {
        return RoutesNames.login;
      }
      return null;
    },
    errorPageBuilder: (context, state) {
      return NoTransitionPage(
        child: UnderConstruction(title: state.matchedLocation),
      );
    },
    routes: [
      GoRoute(
        path: RoutesNames.login,
        builder: _loginHandler,
        redirect: (context, state) {
          if (LoginStore.instance.accessToken.isEmpty) {
            return RoutesNames.home;
          }
          return null;
        },
      ),
      ShellRoute(
        navigatorKey: homeNavigatorKey,
        builder: _homeHandler,
        routes: [
          GoRoute(
            path: RoutesNames.home,
            parentNavigatorKey: homeNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: MainDashboardPage(),
              );
            },
          ),
          ShellRoute(
            parentNavigatorKey: homeNavigatorKey,
            navigatorKey: healthNavigatorKey,
            pageBuilder: (context, state, child) {
              return NoTransitionPage(child: child);
            },
            routes: [
              // Web version
              GoRoute(
                path: RoutesNames.profile,
                parentNavigatorKey: healthNavigatorKey,
                pageBuilder: _profileHandler,
              ),
            ],
          ),

          ShellRoute(
            parentNavigatorKey: homeNavigatorKey,
            navigatorKey: managementNavigatorKey,
            pageBuilder: (context, state, child) {
              return NoTransitionPage(child: child);
            },
            routes: [
              // Mobile version
              GoRoute(
                path: RoutesNames.home,
                parentNavigatorKey: managementNavigatorKey,
                builder: _mainDashboardPageHandler,
              ),
              GoRoute(
                path: RoutesNames.profile,
                parentNavigatorKey: managementNavigatorKey,
                pageBuilder: _profileHandler,
              ),
            ],
          ),

          /*
          GoRoute(
                path: RoutesNames.playerCardDetails,
                parentNavigatorKey: homeNavigatorKey,
                pageBuilder: _playerCardDetailsHandler,
              ),
        */

          /*GoRoute(
                path: RoutesNames.inventory,
                parentNavigatorKey: homeNavigatorKey,
                pageBuilder: _inventoryHandler,
              ),*/

          // GoRoute(
          //   path: RoutesNames.signIn,
          //   parentNavigatorKey: rootNavigatorKey,
          //   pageBuilder: _signInHandler,
          // ),
        ],
      ),
      // Mobile version
      /*
      GoRoute(
        path: RoutesNames.packRevealSummary,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: _packRevealSummaryHandler,
      ),
      */

      /*
      GoRoute(
          path: RoutesNames.packRevealSummaryDesktop,
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: _packRevealSummaryHandlerDesktop),

      GoRoute(
          path: RoutesNames.packRevealDesktop,
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: _packRevealDesktop),
      */

      // GoRoute(
      //   path: RoutesNames.signIn,
      //   parentNavigatorKey: rootNavigatorKey,
      //   pageBuilder: _signInHandler,
      // ),
      // GoRoute(
      //   path: RoutesNames.signUp,
      //   parentNavigatorKey: rootNavigatorKey,
      //   pageBuilder: _signUpHandler,
      // ),
    ],
  );

  /// The `router` getter is used to access the `GoRouter` instance.
  GoRouter get router => _router;
}

/// Workaround method to pop until a specific path.
void popUntilPath(String routePath, BuildContext context) {
  final router = GoRouter.of(context);
  while ('${router.routeInformationProvider.value.uri}' != routePath) {
    if (!router.canPop()) {
      return;
    }
    router.pop();
  }
}
