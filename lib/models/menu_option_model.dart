// File: models/menu_option_model.dart

import 'package:flutter/material.dart';

class MenuOptionModel {
  final String title;
  final IconData icon;
  final Color color;
  final String route;

  MenuOptionModel({
    required this.title,
    required this.icon,
    required this.color,
    required this.route,
  });
}
