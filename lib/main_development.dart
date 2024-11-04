import 'package:api_helper/api_helper.dart';
import 'package:tots/flavor.dart';
import 'bootstrap.dart';

Future<void> main() async {
  bootstrap(
    flavor: FlavorType.dev,
    env: Environments.dev,
  );
}
