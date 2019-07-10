import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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
          child: ParentWidget(),
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
            style: TextStyle(color: Colors.white, fontSize: 22.0),
          ),
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapboxC(
      active: _active,
      onChanged: _handleTapboxChanged,
    );
  }
}

class TapboxB extends StatelessWidget {
  final active;
  final ValueChanged<bool> onChanged;

  const TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!active),
      child: Container(
        width: 200,
        height: 200,
        color: active ? Colors.green : Colors.grey,
        child: Center(
          child: Text(active ? "Active" : "Inactive",
              style: TextStyle(color: Colors.white, fontSize: 32.0)),
        ),
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  final active;
  final ValueChanged<bool> onChanged;

  const TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;
  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: () => widget.onChanged(!widget.active),
      child: Container(
        width: 200,
        height: 200,
        child: Center(
          child: Text(widget.active ? "Active" : "Inactive",
              style: TextStyle(color: Colors.white, fontSize: 32.0)),
        ),
        decoration: BoxDecoration(
          color: widget.active ? Colors.green : Colors.grey,
          border: _highlight ? Border.all(color: Colors.teal[700],width: 10) : null,
        ),
      ),
    );
  }
}
