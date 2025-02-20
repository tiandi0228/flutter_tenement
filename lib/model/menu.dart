import 'package:flutter/material.dart';

class Menu {
  final String title;
  final String path;
  final IconData icon;
  final MaterialColor iconColor;

  Menu({required this.title, required this.path, required this.icon, required this.iconColor});

  @override
  String toString() {
    return 'Menu{title: $title, path: $path, icon: $icon, iconColor: $iconColor}';
  }
}
