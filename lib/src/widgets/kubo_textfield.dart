import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_kubo/src/tools/colors.dart';

// ignore: must_be_immutable
class KuboTextField extends StatelessWidget {
  KuboTextField({
    this.placeholder,
    this.keyboardType,
    this.onChanged,
    this.icon,
    this.iconColor,
    this.initialValue,
    this.textCapitalization,
    this.textInputFormatters,
    this.prefixWidget,
    this.onFieldSubmitted,
    this.suffixText,
    this.onTap,
    this.controller,
  });

  String placeholder;
  TextInputType keyboardType;
  Function onChanged;
  Color iconColor;
  String initialValue;
  TextCapitalization textCapitalization;
  List<TextInputFormatter> textInputFormatters;
  Widget prefixWidget;
  Function onFieldSubmitted;
  String suffixText;
  var icon;
  var controller;
  var onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Palette.white),
        borderRadius: BorderRadius.circular(5),
        color: Palette.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Palette.black.withOpacity(0.5),
            blurRadius: 6.0,
            offset: Offset(0.2, 0.7),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(width: 14),
          Container(
            decoration: BoxDecoration(),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: TextFormField(
                onTap: onTap,
                controller: controller,
                autofocus: false,
                style: TextStyle(color: Palette.black, fontSize: 16),
                keyboardAppearance: Brightness.light,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                initialValue: initialValue,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: placeholder,
                  suffixText: suffixText ?? "",
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                keyboardType: keyboardType ?? TextInputType.text,
                onChanged: onChanged,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              icon,
              color: Colors.black.withOpacity(0.5),
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
