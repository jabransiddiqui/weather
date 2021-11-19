import 'package:flutter/material.dart';

/*
   Navigation Service class for contextless nagivation with the global key concept

*/

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static NavigationService instance = NavigationService();

  NavigationService();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    try {
      return navigatorKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> pushAndReplac(String routeName, {dynamic arguments}) {
    try {
      return navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> pushAndRemoveUntil(String til) {
    try {
      return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        til,
       (route) => false,
      );
    } catch (e) {
      rethrow;
    }
  }

  void popUntil(String routName) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(routName));
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }

  goToRoot() {
    return navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
