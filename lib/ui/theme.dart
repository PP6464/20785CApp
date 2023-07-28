// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

enum theme {
  primary,
  secondary,
}

extension ThemeExt on theme {
  Color get colour {
    switch (this) {
      case theme.primary:
        return Colors.red;
      case theme.secondary:
        return Colors.black;
    }
  }
}