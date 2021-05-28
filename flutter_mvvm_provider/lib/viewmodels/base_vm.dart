part of 'viewmodels.dart';

class BaseVM extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;
  final NavigationService _navigationService = locator<NavigationService>();

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  Future<dynamic>? toNamed(String route) {
    setBusy(false);
    return _navigationService.toNamed(route);
  }

  Future<dynamic>? offNamed(String route) {
    setBusy(false);
    return _navigationService.offNamed(route);
  }

  Future<dynamic>? to(Widget route) {
    setBusy(false);
    return _navigationService.to(route);
  }

  Future<dynamic>? off(Widget route) {
    setBusy(false);
    return _navigationService.off(route);
  }

  Future<dynamic>? goBack([dynamic result]) {
    setBusy(false);
    return _navigationService.goBack(result);
  }

  void showCustomDialog(
    BuildContext context, {
    String? title,
    Widget? titleIcon,
    String? description,
    String? labelCancel,
    String? labelSubmit,
    Function? onSubmit,
    Function? onClose,
    bool? singleButton,
    Color? colorSubmit,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogBox(
          title: title!,
          titleIcon: titleIcon!,
          descriptions: description!,
          labelCancel: labelCancel!,
          labelSubmit: labelSubmit!,
          colorSubmit: colorSubmit,
          onSubmit: onSubmit,
          singleButton: singleButton!,
        );
      },
    ).then((value) {
      if (onClose != null) {
        onClose();
      }
    });
  }

  void showPopUp(
    BuildContext context, {
    required Widget content(BuildContext context),
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: content(context),
        );
      },
    );
  }

  void showSnackBar(BuildContext context, {String text = '', Widget? icon}) {
    Flushbar(
      message: text,
      icon: icon == null
          ? Icon(
              Icons.warning_rounded,
              size: 30.0,
              color: Colors.white,
            )
          : icon,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(10),
      borderRadius: BorderRadius.all(Radius.circular(6)),
    )..show(context);
  }
}
