import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'base_page.dart';
import 'blank_page.dart';
import 'navigator.dart';

class Frame extends StatelessWidget {
  // final void Function(BuildContext context, int index, PageRoute page) pushPage;

  static GlobalKey<NavigatorState> getNextNavigatorKey(
      List<GlobalKey<NavigatorState>> keys,
      GlobalKey<NavigatorState> currentKey) {
    final currentIndex = keys.indexOf(currentKey);
    final nextIndex = currentIndex + 1;
    return (nextIndex < keys.length) ? keys[nextIndex] : keys.last;
  }

  // static void pushPage(BuildContext context, int index, PageRoute page) {
  //   navigatorKeys[MediaQuery.of(context).size.width > 600 ? index : 0]
  //       .currentState
  //       ?.push(page);
  // }

  static void pushPage1(
      BuildContext context, int index, String routeName, Widget page) {
    PageRoute route = MediaQuery.of(context).size.width > 600
        ? PageRouteBuilder(
            settings: RouteSettings(
              name: routeName,
              arguments: {'pop': true, 'id': 123},
            ),
            pageBuilder: (context, a, b) => page,
            //fullscreenDialog: true,
          )
        : MaterialPageRoute(
            builder: (context) => page,
            settings: RouteSettings(name: routeName),
          );
    navigatorKeys[MediaQuery.of(context).size.width > 600 ? index : 0]
        .currentState
        ?.push(route);
  }

  static final List<bool> navigatorStatus = List.generate(3, (index) => false);
  static final List<GlobalKey<NavigatorState>> navigatorKeys =
      List.generate(3, (index) => GlobalKey<NavigatorState>());

  // final PageRoute homePage, blankPage;
  final onGenerateRoute;
  // final int count;
  int currentIndex = 0;
  Frame({
    Key? key,
    // this.count = 3,
    // required this.homePage,
    // required this.blankPage,
    required this.onGenerateRoute,
  }) : super(key: key) {}

  @override
  Widget build(BuildContext context) => MediaQuery.of(context).size.width > 600
      ? Row(
          children: List.generate(
              3,
              (index) => Expanded(
                      child: CustomNavigator(
                    key: navigatorKeys[index],
                    // initialRoute: index == 0
                    //     ? '/' //TabNavigatorRoutes.root
                    //     : '/blank', //TabNavigatorRoutes.blank,
                    // onGenerateInitialRoutes: index == 0
                    //     ? (navigator, initialRoute) => [homePage]
                    //     : (navigator, initialRoute) => [blankPage],
                    //onUnknownRoute: (settings) => blankPage,
                    // MaterialPageRoute(
                    //     builder: (context) => BlankPage(),
                    //     settings: settings),
                    onGenerateRoute: onGenerateRoute,
                    // index == 0
                    //     ? (RouteSettings r) {
                    //         // return homePage;
                    //         return PageRouteBuilder(
                    //             pageBuilder: (context, a, b) => BlankPage(),
                    //             settings: r);
                    //       }
                    //     : (RouteSettings r) {
                    //         // return blankPage;
                    //         return PageRouteBuilder(
                    //             pageBuilder: (context, a, b) => BlankPage(),
                    //             settings: r);
                    //       }
                    //     (RouteSettings routeSettings) {
                    //   // print(
                    //   //     'onGenerate: ${routeSettings} ${routeSettings.name}');
                    //   // if (index == 0)
                    //   //   return homePage;
                    //   // else
                    //   //   return blankPage;

                    //   return pageRouteBuilders(context,
                    //       navigatorKeys[index], routeSettings.name!);
                    // },
                  ))))
      // <Widget>[
      //     Expanded(
      //         child: TabNavigator(
      //       navigatorKey: navigatorKey,
      //       tabItem: TabItem.blue,
      //     )),
      //     Expanded(
      //         child: TabNavigator(
      //       navigatorKey: navigatorKey1,
      //       tabItem: TabItem.red,
      //     )),
      //   ])
      : Navigator(
          key: navigatorKeys[0],
          // initialRoute: index == 0
          //     ? '/' //TabNavigatorRoutes.root
          //     : '/blank', //TabNavigatorRoutes.blank,
          // onGenerateInitialRoutes: index == 0
          //     ? (navigator, initialRoute) => [homePage]
          //     : (navigator, initialRoute) => [blankPage],
          //onUnknownRoute: (settings) => blankPage,
          // MaterialPageRoute(
          //     builder: (context) => BlankPage(),
          //     settings: settings),
          onGenerateRoute: onGenerateRoute);

  // push(value, navigatorKey) {
  //   print('onPush: $value');
  //   navigatorKey.currentState!.push(PageRouteBuilder(
  //     pageBuilder: (context, animation1, animation2) => routeBuilders(
  //       context,
  //       TabNavigatorRoutes.detail,
  //     )[TabNavigatorRoutes.detail]!(
  //       context,
  //     ),
  //     transitionDuration: Duration.zero,
  //     reverseTransitionDuration: Duration.zero,
  //   ));
  //   // navigatorKey1.currentState!.push(PageRouteBuilder(
  //   //   pageBuilder: (context, animation1, animation2) =>
  //   //       routeBuilders[TabNavigatorRoutes.detail]!(context),
  //   //   transitionDuration: Duration.zero,
  //   //   reverseTransitionDuration: Duration.zero,
  //   // )
  // }
  // Navigator(onGenerateRoute: (RouteSettings settings) {
  //   // print('onGenerateRoute: ${settings}');
  //   // if (settings.name == '/' || settings.name == 'search') {
  //   if (settings.name == '/' || settings.name == 'vacancies') {
  //     return PageRouteBuilder(pageBuilder: (_, __, ___) => DashboardPage());
  //   }
  // });
}

// MaterialPageRoute pageRouteBuilders(BuildContext context,
//     GlobalKey<NavigatorState> navigatorKey, String routeName) {
//   print('routeName: $routeName, current navigatorKey: $navigatorKey');

//   switch (routeName) {
//     case '/blank':
//       return MaterialPageRoute(
//           builder: (context) => BlankPage(),
//           settings: RouteSettings(name: routeName));
//     case '/':
//       return MaterialPageRoute(
//           builder: (context) => HomePage(navigatorKey),
//           settings: RouteSettings(name: routeName));
//     case '/test':
//       return MaterialPageRoute(
//           builder: (context) => TestPage(navigatorKey),
//           settings: RouteSettings(name: routeName));
//     case '/details':
//       return MaterialPageRoute(
//           builder: (context) => DetailsPage(navigatorKey),
//           settings: RouteSettings(name: routeName));
//     // default:
//     //   throw 'no page found for routeName: $routeName';
//     default:
//       return MaterialPageRoute(
//           builder: (context) => BlankPage(),
//           settings: RouteSettings(name: routeName));
//   }
// }

// Map<MaterialPageRoute> pageRouteBuilders= {
//   '/blank': MaterialPageRoute(
//           builder: (context) => BlankPage(),
//           settings: RouteSettings(name: routeName));
//     case '/':
//       return MaterialPageRoute(
//           builder: (context) => HomePage(navigatorKey),
//           settings: RouteSettings(name: routeName));
//     case '/test':
//       return MaterialPageRoute(
//           builder: (context) => TestPage(navigatorKey),
//           settings: RouteSettings(name: routeName));
//     case '/details':
//       return MaterialPageRoute(
//           builder: (context) => DetailsPage(navigatorKey),
//           settings: RouteSettings(name: routeName));
//     // default:
//     //   throw 'no page found for routeName: $routeName';
//     default:
//       return MaterialPageRoute(
//           builder: (context) => BlankPage(),
//           settings: RouteSettings(name: routeName));
//   }
// }

// class HomePage extends BasePage {
//   HomePage(navigatorKey, {Key? key}) : super(navigatorKey, key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Home Page'),
//         ),
//         body: ElevatedButton(
//             child: Text('go to test'),
//             onPressed: () => pushRoute(
//                   context,
//                   // TestPage(navigatorKeys[1]),
//                   // RouteSettings(name: '/test'),
//                   PageRouteBuilder(
//                     pageBuilder: (context, a, b) {
//                       return TestPage(navigatorKeys[1]);
//                     },
//                     settings: RouteSettings(name: '/test'),
//                     transitionDuration: Duration(seconds: 0),
//                   ),
//                 )));
//   }
// }

// class TestPage extends BasePage {
//   TestPage(navigatorKey, {Key? key}) : super(navigatorKey, key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Test Page'),
//         ),
//         body: Container(
//           color: Colors.white,
//           child: _buildList(),
//         ));
//   }

//   Widget _buildList() {
//     return ListView.builder(
//         itemCount: materialIndices.length,
//         itemBuilder: (BuildContext context, int index) {
//           int materialIndex = materialIndices[index];
//           return Container(
//             color: Colors.grey[500],
//             child: ListTile(
//               title: Text('$materialIndex', style: TextStyle(fontSize: 24.0)),
//               trailing: Icon(Icons.chevron_right),
//               onTap: () {
//                 // pushRoute(
//                 //   context,
//                 //   // DetailsPage(navigatorKeys[2]),
//                 //   // RouteSettings(name: '/details'),
//                 //   PageRouteBuilder(
//                 //       settings: RouteSettings(
//                 //         name: '/details',
//                 //         arguments: {'pop': true, 'id': materialIndex},
//                 //       ),
//                 //       pageBuilder: (context, a, b) =>
//                 //           DetailsPage(navigatorKeys[2]),
//                 //       fullscreenDialog: true),
//                 // );
//                 pushPage(
//                     context,
//                     2,
//                     PageRouteBuilder(
//                         settings: RouteSettings(
//                           name: '/details',
//                           arguments: {'pop': true, 'id': materialIndex},
//                         ),
//                         pageBuilder: (context, a, b) =>
//                             DetailsPage(navigatorKeys[2]),
//                         fullscreenDialog: true));
//               },
//             ),
//           );
//         });
//   }

//   final List<int> materialIndices = [
//     900,
//     800,
//     700,
//     600,
//     500,
//     400,
//     300,
//     200,
//     100,
//     50
//   ];
// }

// class DetailsPage extends BasePage {
//   // final GlobalKey<NavigatorState> navigatorKey;

//   DetailsPage(navigatorKey, {Key? key}) : super(navigatorKey, key: key);

//   @override
//   Widget build(BuildContext context) {
//     final args =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
//     final message = args['id'].toString();

//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Details page'),
//         ),
//         body: Column(
//           children: [
//             Text(message),
//             ElevatedButton(
//               child: Text('Go to Next page'),
//               onPressed: () {
//                 pushRoute(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => DetailsPage(navigatorKey),
//                         settings: RouteSettings(name: '/details')));
//                 //push(context, '/details');
//                 // this
//                 //     .navigatorKey
//                 //     .currentState!
//                 //     .popUntil(ModalRoute.withName('/details'));
//                 // this.navigatorKey.currentState!.pushNamed('/details');
//               },
//             ),
//           ],
//         ));
//   }
// }
