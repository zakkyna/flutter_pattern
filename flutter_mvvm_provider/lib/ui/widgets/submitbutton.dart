part of 'widgets.dart';

class SubmitButton extends StatelessWidget {
  final Function? onPressed;
  final String label;
  final Color color;
  final bool busy;
  final EdgeInsetsGeometry contentPadding;

  SubmitButton({
    this.label = '',
    this.onPressed,
    this.color = mainColor,
    this.busy = false,
    this.contentPadding = const EdgeInsets.all(defaultPadding),
  });
  @override
  Widget build(BuildContext context) {
    Color? _color = color == null ? mainColor : color;
    return Container(
      width: double.infinity,
      child: TextButton(
        onPressed: busy ? null : () => onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color?>(_color),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 12),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              side:
                  BorderSide(color: _color, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
        ),
        child: busy
            ? SizedBox(
                height: defaultIconSize,
                width: defaultIconSize,
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              )
            : Text(
                label,
                style: whiteLabelButton1,
              ),
      ),
    );
  }
}
