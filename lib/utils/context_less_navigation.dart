import 'package:flutter/material.dart';

import 'global_function.dart';


class ContextLess {
  ContextLess._();
  static final GlobalKey<NavigatorState> navigatorkey =
      GlobalKey<NavigatorState>();

  static NavigatorState get nav {
    return Navigator.of(ApGlobalFunctions .navigatorKey.currentContext!);
  }

  static BuildContext get context {
    return ApGlobalFunctions .navigatorKey.currentContext!;
  }
}

//allows navigation with context.nav
extension EasyNavigator on BuildContext {
  NavigatorState get nav {
    return Navigator.of(this);
  }
}
