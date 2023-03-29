import 'package:flutter/material.dart';

class FocusTestRoute extends StatefulWidget {
  const FocusTestRoute({Key? key}) : super(key: key);

  @override
  _FocusTestRouteState createState() => _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            toolbarOptions: const ToolbarOptions(
              selectAll: true,
              copy: true,
              paste: true,
            ),
            decoration: const InputDecoration(
              labelText: "input1",
            ),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: const InputDecoration(labelText: "input2"),
          ),
          Builder(
            builder: (ctx) {
              return Column(
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(focusNode2);
                      },
                      child: const Text("移动焦点")),
                  ElevatedButton(
                    onPressed: () {
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                    child: const Text("隐藏键盘"),
                  ),
                ],
              );
            },
          ), //Builder
          const Text("自定义下划线颜色"),
          const TextField(
            decoration: InputDecoration(
              labelText: "请输入用户名",
              prefixIcon: Icon(Icons.person),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
