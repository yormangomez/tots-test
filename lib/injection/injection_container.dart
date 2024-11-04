import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tots/app/bloc/app_bloc.dart';
import 'package:tots/feature/auth/bloc/auth_bloc.dart';

import 'package:tots/feature/main_dashboard/bloc/client_bloc.dart';
part 'blocs_injection.dart';
part 'network_injection.dart';
part 'repositories_injection.dart';
part 'resources_injection.dart';

/// Instance of the dependency injection container.
final sl = GetIt.instance;

/// Initialize the dependency injection container.
Future<void> init({
  required Environments environment,
  required void Function(dynamic, StackTrace?)? onError,
}) async {
  //=======================
  // Network
  //=======================
  _initNetworkInjections(environment, onError);

  //=======================
  // DataSource / Resources
  //=======================
  _initResourcesInjections();

  //=======================
  // Repositories
  //=======================
  _initRepositoriesInjections();

  //=======================
  // Blocs
  //=======================
  _initBlocsInjections();
}
