import 'package:flutter/material.dart';

class ClipRoute extends StatelessWidget {
  const ClipRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image avatar = Image.asset("imgs/avatar.png", width: 60.0);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        avatar,
        ClipOval(child: avatar), //裁剪为圆形
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: avatar,
        ),
        ClipPath(
          child: avatar,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              widthFactor: .5,
              child: avatar,
            ),
            const Text("你好世界", style: TextStyle(color: Colors.green))
          ],
        ),
        DecoratedBox(
          decoration: const BoxDecoration(color: Colors.red),
          child: ClipRect(
            clipper: MyClipper(),
            child: avatar,
          ),
        ),
        DecoratedBox(
          decoration: const BoxDecoration(color: Colors.blue),
          child: MyClipRect(
            child: avatar,
          ),
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

class MyClipRect extends StatelessWidget {
  const MyClipRect({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var rect = const Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);
    return ClipRect(
      child: SizedBox(
        width: rect.width,
        height: rect.height,
        child: OverflowBox(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
