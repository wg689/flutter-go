import 'package:flutter/material.dart';

class FormTestRoute extends StatefulWidget {
  const FormTestRoute({Key? key}) : super(key: key);

  @override
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _unameController,
              decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或者邮箱",
                  icon: Icon(Icons.person)),
              validator: (v) {
                return v!.trim().isNotEmpty ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              controller: _pwdController,
              decoration: const InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                icon: Icon(Icons.lock),
              ),
              validator: (v) {
                return v!.trim().length > 5 ? null : "密码不能少于6位";
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("登录"),
                    ),
                    onPressed: () {
                      if ((_formKey.currentState as FormState).validate()) {
                        // 验证通过提交数据
                      }
                    },
                  )),
                ],
              ),
            )
          ],
        ));
  }
}
