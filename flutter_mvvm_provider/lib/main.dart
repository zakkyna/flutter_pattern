import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mvvm_provider/locator.dart';
import 'package:flutter_mvvm_provider/services/services.dart';
import 'package:flutter_mvvm_provider/viewmodels/viewmodels.dart';

void main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //use screen lock potrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BaseVM>(
          create: (_) => locator<BaseVM>(),
        ),
      ],
      child: MaterialApp(
        title: 'Toko Gadai Owner',
        navigatorKey: locator<NavigationService>().navigatorKey,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(),
      ),
    );
  }
}
