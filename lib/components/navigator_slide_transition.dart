import 'package:flutter/material.dart';

class NavigatorSlideTransition extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;
  NavigatorSlideTransition({required this.child, required this.direction})
      : super(
            reverseTransitionDuration: const Duration(milliseconds: 400),
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final tween = Tween<Offset>(begin: getOffset(), end: Offset.zero);
    final offsetAnimation = animation.drive(tween);
    return SlideTransition(position: offsetAnimation, child: child);
  }

  getOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
      default:
    }
  }
}
