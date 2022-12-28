// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ExpansionTileComponents extends StatelessWidget {
  final String expensionTitle;
  final double paddingLeft;
  final IconData icon;
  final List<Widget> childrens;
  final Function(bool)? onExpansionChanged;
  const ExpansionTileComponents(
      {super.key,
      required this.icon,
      required this.expensionTitle,
      required this.paddingLeft,
      required this.childrens,
      this.onExpansionChanged});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.only(left: paddingLeft),
      title: Text(
        expensionTitle,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
      leading: Icon(icon),
      controlAffinity: ListTileControlAffinity.leading,
      onExpansionChanged: onExpansionChanged,
      children: childrens,
    );
  }
}
