import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tots/core/database/login_store.dart';
import 'package:tots/core/database/user_store.dart';

import 'package:tots/feature/main_dashboard/bloc/client_bloc.dart';
import 'package:tots/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tots/app/bloc/app_bloc.dart';
import 'package:tots/app/routes/router_config.dart';
import 'package:tots_ui/tots_ui.dart';

import '../../injection/injection_container.dart' as di;

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final router = CustomRouterConfig().router;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AppBloc>()),
        BlocProvider(create: (context) => di.sl<ClientBloc>()),
      ],
      child: Builder(builder: (context) {
        return FutureBuilder(
            future: _loadUserData(context),
            builder: (context, snapshot) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: MediaQuery.of(context).textScaler.clamp(
                        minScaleFactor: 0.75,
                        maxScaleFactor: 1.25,
                      ),
                ),
                child: AnnotatedRegion<SystemUiOverlayStyle>(
                  value: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.dark,
                  ),
                  child: MaterialApp.router(
                    debugShowCheckedModeBanner: true,
                    theme: const AppTheme().themeData,
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    routeInformationProvider: router.routeInformationProvider,
                    routeInformationParser: router.routeInformationParser,
                    routerDelegate: router.routerDelegate,
                    scaffoldMessengerKey: rootScaffoldMessengerKey,
                  ),
                ),
              );
            });
      }),
    );
  }

  Future<void> _loadUserData(BuildContext context) async {
    final appBloc = context.read<AppBloc>();

    if (appBloc.state.token == null ||
        (appBloc.state.token?.isNotEmpty ?? false)) {
      final token = LoginStore.instance.accessToken;
      final user = UserStore.instance;

      if (token.isNotEmpty) {
        appBloc.add(
          SetUserData(
            token: token,
            userName: user.email,
          ),
        );
      }
    }
  }
}
