import 'package:flutter/material.dart';
import 'frame.dart';


// abstract class BasePage extends StatelessWidget {
//   final GlobalKey<NavigatorState> navigatorKey;

//   BasePage(this.navigatorKey, {Key? key}) : super(key: key) {
//     print('BasePage constructor ${this.navigatorKey.hashCode}');
//   }

//   void pushRoute(
//       BuildContext context,
//       //Widget page, RouteSettings settings,
//       PageRoute route) {
//     String? currentPath;
//     navigatorKey.currentState?.popUntil((r) {
//       currentPath = r.settings.name;
//       print('pop:  ${r.settings.name}, ${r.isCurrent}');
//       return r.isCurrent;
//       // return currentPath != route;
//     });
//     // print('pushNamed: $routeName, currentPath $currentPath');
//     // if (currentPath == settings.name) return;
//     print(
//         'route: ${route.settings.name}, ${route.isCurrent}, current: ${currentPath}');
//     if (currentPath == route.settings.name) return;
//     if (route.isCurrent) return;

//     // this.navigatorKey.currentState!.push(
//     //     MaterialPageRoute(builder: (context) => page, settings: settings));

//     GlobalKey<NavigatorState> key =
//         getNextNavigatorKey(navigatorKeys, this.navigatorKey);

//     if (route.settings.arguments != null &&
//         (route.settings.arguments as dynamic)!['pop'] == true)
//       key.currentState!.pop();

//     key.currentState!.push(route);
//   }

  /// Navigates through the application. Only replaces the top Route if it is
  /// different from the new Route. Always keeps the home page as base of the
  /// Navigator stack. New screens are pushed on the Navigator stack. When the
  /// user switches between non-home screens, the new screen replaces the old
  /// screen. In this way, the stack of screens from the drawer is never higher
  /// than 2. Returning to the HomeScreen is done by just popping the current
  /// Route.
  // void _changeRoute(BuildContext context, String newRouteName) {
  //   // Close drawer
  //   Navigator.pop(context);

  //   // Check current screen status
  //   bool currentRouteIsHome = false;
  //   bool currentRouteIsNewRoute = false;

  //   Navigator.popUntil(context, (currentRoute) {
  //     // This is just a way to access currentRoute; the top route in the
  //     // Navigator stack.
  //     if (currentRoute.settings.name == HomeScreen.ROUTE_NAME) {
  //       currentRouteIsHome = true;
  //     }
  //     if (currentRoute.settings.name == newRouteName) {
  //       currentRouteIsNewRoute = true;
  //     }

  //     // Return true so popUntil() pops nothing.
  //     return true;
  //   });

  //   // Switch screen
  //   if (!currentRouteIsNewRoute) {
  //     // Only switch screen if new route is different from current route.
  //     if (currentRouteIsHome) {
  //       // Navigate from home to non-home screen.
  //       Navigator.pushNamed(context, newRouteName);
  //     } else {
  //       if (newRouteName == HomeScreen.ROUTE_NAME) {
  //         // Navigate from non-home screen to home.
  //         Navigator.pop(context);
  //       } else {
  //         // Navigate from non-home screen to non-home screen.
  //         Navigator.popAndPushNamed(context, newRouteName);
  //       }
  //     }
  //   }
  // }

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
// }
