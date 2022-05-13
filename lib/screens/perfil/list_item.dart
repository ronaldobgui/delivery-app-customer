import 'package:flutter/material.dart';

class ListItem {
  final String title;
  final String subTitle;
  final IconData icon;
  final void Function(BuildContext) event;

  const ListItem({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.event,
  });
}
