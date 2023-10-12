import 'package:flutter/material.dart';
import 'package:watiq/util/strings.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    required this.suffixIcon,
    this.controller,
    this.hintStyle,
    required this.color,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  final TextInputType textInputType;
  final String hintText;
  final TextStyle? hintStyle;
  final Icon? prefixIcon;
  final Widget suffixIcon;
  final bool obscureText;
  final Color color;
  final TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: controller,

      decoration: InputDecoration(
          suffixIcon:suffixIcon,
          filled: true,
          fillColor:color,
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefixIcon,
          enabledBorder: buildOutlineInputBorder(
            borderColor: Color(0xffE8E8E8),
          ),
          focusedBorder: buildOutlineInputBorder(borderColor: mainColor)
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color borderColor = const  Color(0xFFF7F7F7)}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1,
        color: borderColor,
      ),
    );
  }
}
