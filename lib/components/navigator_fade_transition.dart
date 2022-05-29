import 'package:flutter/material.dart';

class NavigatorFadeTransition extends PageRouteBuilder {
  final Widget child;
  NavigatorFadeTransition({required this.child})
      : super(
            reverseTransitionDuration: const Duration(milliseconds: 500),
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}
