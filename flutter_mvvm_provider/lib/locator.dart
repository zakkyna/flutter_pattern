import 'package:get_it/get_it.dart';
import 'package:flutter_mvvm_provider/services/services.dart';
import 'package:flutter_mvvm_provider/viewmodels/viewmodels.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => BaseVM());
  locator.registerLazySingleton(() => NavigationService());
}
