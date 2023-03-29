import 'package:flutter/material.dart';

class StackRoute extends StatelessWidget {
  const StackRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        children: <Widget>[
          Container(
            child: const Text(
              "hello word",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),
          // const Positioned(
          //   left: 18.0,
          //   child: Text("I am Jack"),
          // ),
          // const Positioned(
          //   child: Text("your friedn"),
          //   top: 18.0
          // ),
        ],
      ),
    );
  }
}
