import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RouteBuilder {
  static Route<T> withoutAnimation<T>(
    _,
    Widget child,
    CustomPage<T> page,
  ) {
    return PageRouteBuilder<T>(
      settings: page,
      pageBuilder: (_, __, ___) => child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }

  static Route<T> dismissibleDialog<T>(
    _,
    Widget child,
    CustomPage<T> page,
  ) {
    return PageRouteBuilder<T>(
      settings: page,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      opaque: false,
      fullscreenDialog: true,
      pageBuilder: (_, __, ___) => child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }

  static Route<T> modalDialog<T>(
    BuildContext context,
    Widget child,
    CustomPage<T> page,
  ) {
    return PageRouteBuilder<T>(
      settings: page,
      opaque: false,
      fullscreenDialog: true,
      pageBuilder: (_, __, ___) => child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}
