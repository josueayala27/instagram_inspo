import 'package:flutter/material.dart';

class ClippedText extends StatelessWidget {
  final List<String> texts;

  const ClippedText(this.texts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: texts
            .map((el) => Text(
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                el))
            .toList());
  }
}
