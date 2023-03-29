import 'package:flutter/material.dart';

class FittedBoxRoute extends StatelessWidget {
  const FittedBoxRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Row(children: [Text("XX" * 30)]),
        ),
        ...wRows(),
      ],
    );
  }

  Widget wContainer(BoxFit boxFit) {
    return ClipRect(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
        child: FittedBox(
          fit: boxFit,
          child: Container(width: 60, height: 70, color: Colors.blue),
        ),
      ),
    );
  }

  List<Widget> wRows() {
    return [
      wRow(" 900000000000 "),
      SingleLineFittedBox(child: wRow(' 900000000000000 ')),
      wRow('800'),
      SingleLineFittedBox(child: wRow(' 800 ')),
    ]
        .map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: e,
            ))
        .toList();
  }

  Widget wRow(String text) {
    Widget child = Text(text);
    child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [child, child, child],
    );
    return child;
  }

  Widget wRow1(String text) {
    Widget child = Text(text);
    child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [child, child, child],
    );
    return LayoutBuilder(
      builder: (_, constraints) {
        // ignore: avoid_print
        print(constraints);
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minWidth: constraints.maxWidth,
              maxWidth: double.infinity,
            ),
            child: child,
          ),
        );
      },
    );
  }
}

class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minWidth: constraints.maxWidth,
              maxWidth: double.infinity,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
