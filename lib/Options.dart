import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  Options(this.text, this.ontap, {super.key});
  String text;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: ontap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff150364),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
