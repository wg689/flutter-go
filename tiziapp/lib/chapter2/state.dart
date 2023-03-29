import 'package:flutter/material.dart';

class StateLifeCycleTest extends StatelessWidget {
  const StateLifeCycleTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CounterWidget();
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key, this.initValue = 0}) : super(key: key);
  final int initValue;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    print("build22");
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('$_counter'),
          onPressed: () => setState(() {
            () => ++_counter;
          }),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate11");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose11");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble11");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
