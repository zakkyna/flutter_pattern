part of 'widgets.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, labelCancel, labelSubmit;
  final Function? onSubmit;
  final bool singleButton;
  final Widget titleIcon;
  final Color? colorSubmit;

  const CustomDialogBox({
    Key? key,
    this.title = '',
    this.descriptions = '',
    this.labelCancel = 'Close',
    this.labelSubmit = 'Submit',
    this.onSubmit,
    this.singleButton = false,
    this.titleIcon = const SizedBox(),
    this.colorSubmit,
  }) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              widget.titleIcon,
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: Text(
                  widget.title,
                  style: blackFontStyle2,
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.descriptions,
            style: blackFontStyle4,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color?>(
                    Colors.white,
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  widget.labelCancel,
                  style: greyLabelButton,
                ),
              ),
              if (widget.singleButton)
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(
                      widget.colorSubmit == null
                          ? Colors.green
                          : widget.colorSubmit,
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: () => widget.onSubmit!(),
                  child: Text(
                    widget.labelSubmit,
                    style: whiteLabelButton,
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
