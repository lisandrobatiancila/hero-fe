import 'package:flutter/material.dart';

class ButtonComponent {
  @override
  Widget CustomButton (Function() onPressed, Widget child, ButtonStyle? style) {
    return OutlinedButton(
      onPressed: onPressed, 
      style: style,
      child: child,
    );
  }
}