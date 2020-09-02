import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class SmartFlareAnimation extends StatefulWidget {
  SmartFlareAnimation({Key key}) : super(key: key);

  @override
  _SmartFlareAnimationState createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  static const double AnimationWidth = 295.0;
  static const double AnimationHeight = 251.0;

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AnimationWidth,
        height: AnimationHeight,
        child: GestureDetector(
            onTapUp: (tapInfo) {
              var localTouchPosition = (context.findRenderObject() as RenderBox)
                  .globalToLocal(tapInfo.globalPosition);

              var topHalfTouched = localTouchPosition.dy < AnimationHeight / 2;
              var leftSideTouched = localTouchPosition.dx < AnimationWidth / 3;
              var rightSideTouched =
                  localTouchPosition.dx > (AnimationWidth / 3) * 2;
              var middleTouched = !leftSideTouched && !rightSideTouched;

              if (leftSideTouched && topHalfTouched) {
                print('Topleft');
              } else if (middleTouched && topHalfTouched) {
                print('Topmiddle');
              } else if (rightSideTouched && topHalfTouched) {
                print('Topright');
              } else {
                if (isOpen) {
                  print('Bottom Close');
                } else {
                  print('Bottom Open');
                }
                setState(() {
                  isOpen = !isOpen;
                });
              }
            },
            child: FlareActor(
              'assets/button-animation.flr',
              animation: isOpen ? 'activate' : 'deactivate',
            )));
  }
}
