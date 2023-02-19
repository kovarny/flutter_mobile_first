import 'package:flutter/material.dart';
import 'frame.dart';

GlobalKey<NavigatorState> getNextNavigatorKey(
    List<GlobalKey<NavigatorState>> keys,
    GlobalKey<NavigatorState> currentKey) {
  final currentIndex = keys.indexOf(currentKey);
  final nextIndex = currentIndex + 1;
  return (nextIndex < keys.length) ? keys[nextIndex] : keys.last;
}

abstract class BasePage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  BasePage(this.navigatorKey, {Key? key}) : super(key: key) {
    print('BasePage constructor ${this.navigatorKey.hashCode}');
  }

  void pushRoute(BuildContext context, MaterialPageRoute route) {
    String? currentPath;
    navigatorKey.currentState?.popUntil((route) {
      currentPath = route.settings.name;
      // print('pop:  ${route.settings.name}, ${route.isCurrent}');
      // return route.isCurrent;
      return currentPath != route;
    });
    // print('pushNamed: $routeName, currentPath $currentPath');
    //if (currentPath == route.isCurrent routeName) return;
    if (route.isCurrent) return;

    // this.navigatorKey.currentState!.push(MaterialPageRoute(
    //     builder: (context) =>
    //         routeBuilders(context, navigatorKey)[routeName]!(context),

    //     settings: RouteSettings(name: routeName)));

    GlobalKey<NavigatorState> key =
        getNextNavigatorKey(navigatorKeys, this.navigatorKey);

    key.currentState!.push(route);
  }

  // void push(BuildContext context, String routeName) {
  //   //print('Current route: ${ModalRoute()}');

  //   // var route = ModalRoute.of(context);
  //   // if (route != null) print(route.settings);
  //   // String currentRoute = ModalRoute.of(context)?.settings.name ?? '';
  //   // print('current route: ${currentRoute}');
  //   // if (route != null &&
  //   //     route.settings.name != null &&
  //   //     routeName == route.settings.name) {
  //   //   print('popUntil $routeName');
  //   //   this.navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  //   // }
  //   String? currentPath;
  //   navigatorKey.currentState?.popUntil((route) {
  //     currentPath = route.settings.name;
  //     // print('pop:  ${route.settings.name}, ${route.isCurrent}');
  //     // return route.isCurrent;
  //     return currentPath != route;
  //   });
  //   print('pushNamed: $routeName, currentPath $currentPath');
  //   if (currentPath == routeName) return;

  //   // this.navigatorKey.currentState!.push(MaterialPageRoute(
  //   //     builder: (context) =>
  //   //         routeBuilders(context, navigatorKey)[routeName]!(context),

  //   //     settings: RouteSettings(name: routeName)));

  //   GlobalKey<NavigatorState> key =
  //       getNextNavigatorKey(navigatorKeys, this.navigatorKey);

  //   key.currentState!.push(
  //     pageRouteBuilders(context, key, routeName),
  //   );
  //   // this
  //   //     .navigatorKey
  //   // currentState!.push(pageRouteBuilders(context, navigatorKey, routeName));
  // }
}
