import 'package:flutter/material.dart';

class SwitchAndCheckBoxRoute extends StatefulWidget {
  const SwitchAndCheckBoxRoute({Key? key}) : super(key: key);
  @override
  _SwitchAndCheckBoxRouteState createState() => _SwitchAndCheckBoxRouteState();
}

class _SwitchAndCheckBoxRouteState extends State<SwitchAndCheckBoxRoute> {
  bool _switchSelected = true;
  bool _checkBoxSelectd = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            const Text("关"),
            Switch(value: !_switchSelected, onChanged: (value) {}),
            const Text("关"),
          ],
        ),
        Row(
          children: <Widget>[
            Checkbox(
              value: _checkBoxSelectd,
              onChanged: (value) {
                setState(() {
                  _checkBoxSelectd = value!;
                });
              },
            ),
            const Text("未选中"),
            Checkbox(
                value: !_checkBoxSelectd,
                activeColor: Colors.red,
                onChanged: (value) {}),
            const Text("选中"),
          ],
        )
      ],
    );
  }
}
