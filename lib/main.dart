import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter demo"),
        ),
        body: Center(
          child: TapboxA(),
        ),
      ),
    );
  }
}

class TapboxA extends StatefulWidget {
  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = true;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 100,
        height: 100,
        color: _active ? Colors.green : Colors.grey,
        child: Center(
          child: Text(
            _active ? "Active" : "Inactive",
            style: TextStyle(color: Colors.white,
            fontSize: 22.0),
          ),
        ),
      ),
    );
  }
}
