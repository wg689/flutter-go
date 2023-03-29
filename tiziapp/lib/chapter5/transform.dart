import 'package:flutter/material.dart';

import 'dart:math' as math;

class TranformRoute extends StatelessWidget {
  const TranformRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = [
      Container(
        color: Colors.black,
        child: Transform(
          alignment: Alignment.topRight,
          transform: Matrix4.skewY(0.3),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.deepOrange,
            child: const Text("Apartment for rent!"),
          ),
        ),
      ),
      DecoratedBox(
        decoration: const BoxDecoration(color: Colors.red),
        //默认的原点左上角 ,左移20像素 ,向上平移5像素
        child: Transform.translate(
          offset: const Offset(-20.0, -5.0),
          child: const Text("Hello word"),
        ),
      ),
      DecoratedBox(
        decoration: const BoxDecoration(color: Colors.red),
        child: Transform.rotate(
          angle: math.pi / 2,
          child: const Text("Hello word"),
        ),
      ),
      DecoratedBox(
        decoration: const BoxDecoration(color: Colors.red),
        child: Transform.scale(
          scale: 1.5, // 放大到1.5倍
          child: const Text("Hello word"),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DecoratedBox(
            decoration: const BoxDecoration(color: Colors.red),
            child: Transform.scale(
              scale: 1.5,
              child: const Text("hello word"),
            ),
          ),
          const Text(
            "您好",
            style: TextStyle(color: Colors.green, fontSize: 18.0),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: RotatedBox(
              quarterTurns: 1,
              child: Text("hello word"),
            ),
          ),
          Text(
            "你好",
            style: TextStyle(color: Colors.green, fontSize: 18.0),
          )
        ],
      ),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: children
          .map((e) => Padding(
                padding: const EdgeInsets.only(top: 30),
                child: e,
              ))
          .toList(),
    );
  }
}
