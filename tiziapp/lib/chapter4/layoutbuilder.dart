import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';

import '../common.dart';

class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          return Column(
            children: children,
            mainAxisSize: MainAxisSize.min,
          );
        } else {
          var _children = <Widget>[];
          // ignore: dead_code
          for (var i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              _children.add(Row(
                children: [children[i], children[i + 1]],
                mainAxisSize: MainAxisSize.min,
              ));
            } else {
              _children.add(children[i]);
            }
          }
          return Column(
            children: _children,
            mainAxisSize: MainAxisSize.min,
          );
        }
      },
    );
  }
}

class LayoutBuilderRoute extends StatelessWidget {
  const LayoutBuilderRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _children = List.filled(6, const Text("A"));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 190, child: ResponsiveColumn(children: _children)),
        ResponsiveColumn(children: _children),
        LayoutLogPrint(child: const Text("flutter")),
      ],
    );
  }
}
