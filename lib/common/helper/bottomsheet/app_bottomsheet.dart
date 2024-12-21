import 'package:flutter/material.dart';

 class AppBottomsheet{
  static Future<void> display(BuildContext context, Widget widget) {
   return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      builder: (_) {
        return widget;
      }
    );
  }
}