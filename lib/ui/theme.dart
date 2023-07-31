// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

enum theme {
  primary,
  secondary,
  darkAppBar,
  darkSurface,
}

extension ThemeExt on theme {
  Color get colour {
    switch (this) {
      case theme.primary:
        return Colors.red;
      case theme.secondary:
        return Colors.black;
      case theme.darkAppBar:
        return const Color(0xFF303030);
      case theme.darkSurface:
        return const Color(0xFF101010);
    }
  }
}