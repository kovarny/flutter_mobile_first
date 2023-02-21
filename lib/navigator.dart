import 'package:flutter/material.dart';

import 'frame.dart';

class CustomNavigator extends Navigator {
  final GlobalKey<NavigatorState> key;

  CustomNavigator(
      {required this.key,
      String? initialRoute,
      RouteFactory? onGenerateRoute,
      RouteFactory? onUnknownRoute,
      List<Page<dynamic>> pages = const []})
      : super(
            pages: pages,
            key: key,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            onUnknownRoute: onUnknownRoute);

  @override
  NavigatorState createState() => CustomNavigatorState();
}

class CustomNavigatorState extends NavigatorState {
  @override
  Future<bool> maybePop<T extends Object?>([T? result]) {
    if (canPop()
        //  &&
        //     _history.isNotEmpty &&
        //     _history.last == widget.pages.first)
        ) {
      return Future.value(false);
    }
    return super.maybePop(result);
  }
}
