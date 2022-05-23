
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'injector.config.dart';

final inject = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  $initGetIt(inject);
}
