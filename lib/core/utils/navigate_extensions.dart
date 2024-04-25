import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? argument}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? argument, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: argument);
  }

  void pop() => Navigator.of(this).pop();
  Future<dynamic> push(Widget screen, {Object? argument}) =>
      Navigator.of(this).push(
        MaterialPageRoute(
            builder: (context) => screen,
            settings: RouteSettings(arguments: argument)),
      );

  void pushAndRemoveUntil(Widget screen, {Object? argument}) =>
      Navigator.of(this).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => screen,
              settings: RouteSettings(arguments: argument)),
          (Route<dynamic> route) => false);
}
