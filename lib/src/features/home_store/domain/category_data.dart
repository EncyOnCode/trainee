import 'package:flutter/material.dart';

class Category {
  /// Category item.
  const Category({
    required this.icon,
    required this.title,
  });

  /// The icon of the category.
  final IconData icon;

  /// The title of the category.
  final String title;
}
