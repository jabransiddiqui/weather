import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
        required this.childWidget,
      required this.onPressed,
      this.cornerRadius = 12.0,
      this.height = 48.0,
      this.isLoading = false,
      this.isOutline = false}): super(key: key);
    
  final GestureTapCallback onPressed;
  final Widget childWidget;
  final double cornerRadius;
  final double height;
  final bool isLoading;
  final bool isOutline;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(
          width: 1,
          color: isOutline == true
              ? (isLoading == true
                  ? Theme.of(context)
                      .colorScheme
                      .primaryVariant
                      .withOpacity(0.6)
                  : Theme.of(context).primaryColor)
              : Colors.transparent,
        ),
        color: isOutline == false
            ? (isLoading == true
                ? Theme.of(context).disabledColor.withOpacity(0.6)
                : Theme.of(context).primaryColor)
            : Colors.transparent,
      ),
      child: TextButton(
        key: key,
        // color: isLoading == true ? Theme.of(context).colorScheme.primaryVariant.withOpacity(0.6) : Theme.of(context).primaryColor,
        // splashColor: Theme.of(context).colorScheme.primaryVariant,
        // height: height,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: childWidget,
            )
          ],
        ),
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ))),
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(cornerRadius)),
      ),
    );
  }
}
