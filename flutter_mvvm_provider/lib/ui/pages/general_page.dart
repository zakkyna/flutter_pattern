part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final Widget child;
  final String title;
  final String subtitle;
  final Function? onBackButtonTap;
  final Function? onHelpButtonTap;
  final Color? bgColor;
  final bool unscrollable;
  GeneralPage({
    this.child = const SizedBox(),
    this.title = "Title",
    this.subtitle = "",
    this.onBackButtonTap,
    this.onHelpButtonTap,
    this.bgColor,
    this.unscrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            SafeArea(
              child: Container(
                color: bgColor == null ? Colors.white : bgColor,
              ),
            ),
            SafeArea(
              child: unscrollable
                  ? Column(
                      children: [
                        Container(
                          color: mainColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                            vertical: 10,
                          ),
                          width: double.infinity,
                          height: subtitle.isEmpty ? 60 : 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              onBackButtonTap == null
                                  ? SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        onBackButtonTap!();
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                        size: defaultIconSize,
                                      ),
                                    ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    title,
                                    style: subtitle.isEmpty
                                        ? whiteTitle1
                                        : whiteTitle2,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  subtitle.isEmpty
                                      ? SizedBox()
                                      : Text(
                                          subtitle,
                                          style: whiteSubTitle,
                                        ),
                                ],
                              ),
                              onHelpButtonTap == null
                                  ? SizedBox()
                                  : GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.info,
                                        color: Colors.white,
                                        size: defaultIconSize,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: child,
                        ),
                      ],
                    )
                  : ListView(
                      children: [
                        Container(
                          color: mainColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                            vertical: 10,
                          ),
                          width: double.infinity,
                          height: subtitle.isEmpty ? 60 : 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              onBackButtonTap == null
                                  ? SizedBox()
                                  : GestureDetector(
                                      onTap: () => onBackButtonTap,
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                        size: defaultIconSize,
                                      ),
                                    ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    title,
                                    style: subtitle.isEmpty
                                        ? whiteTitle1
                                        : whiteTitle2,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  subtitle.isEmpty
                                      ? SizedBox()
                                      : Text(
                                          subtitle,
                                          style: whiteSubTitle,
                                        ),
                                ],
                              ),
                              onHelpButtonTap == null
                                  ? SizedBox()
                                  : GestureDetector(
                                      onTap: () => onHelpButtonTap,
                                      child: Icon(
                                        Icons.info,
                                        color: Colors.white,
                                        size: defaultIconSize,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        child
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
