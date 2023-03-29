import 'package:flutter/material.dart';

class WrapAndFlowRoute extends StatelessWidget {
  const WrapAndFlowRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [buildWrap(), buildFlow()],
    );
  }

  Widget buildWrap() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      alignment: WrapAlignment.center,
      children: const <Widget>[
        Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("A"),
            ),
            label: Text("hamilton")),
        Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("A"),
            ),
            label: Text("hamilton2")),
        Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("A"),
            ),
            label: Text("hamilton3")),
        Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("A"),
            ),
            label: Text("hamilton4")),
      ],
    );
  }

  Widget buildFlow() {
    return Flow(
      delegate: TestFlowDelegate(margin: const EdgeInsets.all(10.0)),
      children: <Widget>[
        Container(
          width: 80,
          height: 80.0,
          color: Colors.red,
        ),
        Container(
          width: 80,
          height: 80.0,
          color: Colors.blue,
        ),
        Container(
          width: 80,
          height: 80.0,
          color: Colors.yellow,
        ),
        Container(
          width: 80,
          height: 80.0,
          color: Colors.brown,
        ),
        Container(
          width: 80,
          height: 80.0,
          color: Colors.purple,
        ),
      ],
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin;
  TestFlowDelegate({this.margin = EdgeInsets.zero});
  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return const Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
