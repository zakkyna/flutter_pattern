part of 'services.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic>? toNamed(String routeName) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }

  Future<dynamic>? offNamed(String routeName) {
    return navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  Future<dynamic>? to(Widget route) {
    return navigatorKey.currentState
        ?.push(CupertinoPageRoute(builder: (BuildContext context) => route));
  }

  Future<dynamic>? off(Widget route) {
    return navigatorKey.currentState?.pushAndRemoveUntil(
        CupertinoPageRoute(builder: (BuildContext context) => route),
        (Route<dynamic> route) => false);
  }

  Future<dynamic>? goBack([dynamic result]) async {
    return navigatorKey.currentState?.pop(result);
  }

  Future<dynamic>? pushReplacement(Widget route) async {
    return navigatorKey.currentState?.pushReplacement(
        CupertinoPageRoute(builder: (BuildContext context) => route));
  }
}
