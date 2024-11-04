import 'dart:async';
import 'dart:developer';

import 'package:api_helper/api_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:tots/core/database/db.dart';
import 'package:tots/core/database/login_store.dart';
import 'package:tots/core/database/user_store.dart';
import 'package:tots/flavor.dart';

import 'app/view/app.dart';
import 'injection/injection_container.dart' as di;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom instance of [BlocObserver] which logs
/// any state changes and errors.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

/// Bootstrap is responsible for any common setup and calls
/// [runApp] with the widget returned by [builder] in an error zone.
Future<void> bootstrap({
  required FlavorType flavor,
  required Environments env,
}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  Bloc.observer = AppBlocObserver();
  await runZonedGuarded(() async {
    Flavor.instance.setFlavor = flavor;
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    await di.init(
      environment: env,
      onError: (exception, stack) {},
    );

    await DB.instance.init();
    await UserStore.instance.init();
    await LoginStore.instance.init();

    runApp(const MyApp());
  }, onError);
}

onError(Object exception, StackTrace stackTrace) {}
