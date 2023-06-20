import 'package:flutter/material.dart';

class HomeFilter extends StatelessWidget {
  final String title;
  final bool isSelected;

  const HomeFilter({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
          style: TextStyle(color: isSelected ? Colors.white : Colors.black87),
          title),
    );
  }
}
