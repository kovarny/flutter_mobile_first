import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<GlobalKey<NavigatorState>> navigatorKeys =
    List.generate(4, (index) => GlobalKey<NavigatorState>());

class Frame extends ConsumerWidget {
  final MaterialPageRoute homePage, blankPage;
  final int count;
  int currentIndex = 0;
  Frame(
      {Key? key,
      this.count = 1,
      required this.homePage,
      required this.blankPage})
      : super(key: key) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      MediaQuery.of(context).size.width > 600 || count > 1
          ? Row(
              children: List.generate(
                  count,
                  (index) => Expanded(
                          child: Navigator(
                        key: navigatorKeys[index],

                        initialRoute: index == 0
                            ? '/' //TabNavigatorRoutes.root
                            : '/blank', //TabNavigatorRoutes.blank,
                        // onGenerateInitialRoutes: (navigator, initialRoute) =>
                        //     index == 0 ? [homePage] : [blankPage],
                        onGenerateRoute: (routeSettings) {
                          print('onGenerate: ${routeSettings}');
                          // print(
                          //     'onGenerateRoute: ${index}, ${index < count - 1 ? index + 1 : count - 1}');
                          // return homePage;

                          if (index == 0) return homePage;
                          return blankPage;
                          // pageRouteBuilders(
                          //     context, navigatorKeys[0], routeSettings.name!);
                        },
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
          : Navigator();

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
