import 'package:flutter/material.dart';

Widget textWidget(String title, double fontsize, FontWeight fontweight,
    String fontfamily, var color, String align, bool underline) {
  return Text(
    title,
    textAlign: align == 'c' ? TextAlign.center : TextAlign.start,
    style: TextStyle(
      fontSize: fontsize,
      fontFamily: fontfamily,
      fontWeight: fontweight,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      color: Color(color),
    ),
    overflow: TextOverflow.ellipsis,
    maxLines: 4,
  );
}

InputDecoration inputDecoration(BuildContext context,
    {String? hint, Widget? prefixIcon}) {
  return InputDecoration(
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff0B58A0))),
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffBDC4CC))),
    labelText: hint,
    labelStyle: TextStyle(color: Color(0xff9E9E9E)),
    contentPadding: EdgeInsets.only(top: 8, bottom: 8),
    prefixIcon: prefixIcon,
  );
}

// height * 0.07 for top padding
