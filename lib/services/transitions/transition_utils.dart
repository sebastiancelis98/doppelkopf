import 'package:flutter/material.dart';

enum SlideType {
  LEFT, RIGHT, UP, DOWN
}

Route slideTransitionBuilder(Widget toPage, SlideType slideType) {

  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => toPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      double xOffset = 0.0, yOffset = 0.0;
      switch(slideType){
        case SlideType.LEFT:
          xOffset = 1;
          break;
        case SlideType.RIGHT:
          xOffset = -1;
          break;
        case SlideType.UP:
          yOffset = 1;
          break;
        case SlideType.DOWN:
          yOffset = -1;
          break;
      }

      var begin = Offset(xOffset, yOffset);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}