import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_kubo/src/tools/colors.dart';
import 'package:prueba_kubo/src/tools/styles.dart';

class KuboButton extends StatelessWidget {
  KuboButton({
    @required this.onPressed,
    this.title,
    this.backgroundColor,
    this.height,
    this.width,
    this.padding,
    this.canPush = false,
  });
  String title;
  Color backgroundColor;
  Function onPressed;
  double height;
  double width;
  bool canPush;
  EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: height ?? 40,
          width: width ?? 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Palette.kuboColor,
              width: 2,
            ),
            color: canPush ? Palette.kuboColor : Palette.white,
          ),
          child: CupertinoButton(
            padding: padding ?? EdgeInsets.zero,
            child: Center(
              child: Text(
                title ?? "Continuar",
                style: canPush ? Styles.activeButtonStyle : Styles.buttonStyle,
                textAlign: TextAlign.center,
              ),
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
