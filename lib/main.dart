import 'package:flutter/material.dart';

void main() {
  runApp(BiolocatorApp());
}

class BiolocatorApp extends StatefulWidget {
  BiolocatorApp({Key key}) : super(key: key);

  @override
  _BiolocatorAppState createState() => _BiolocatorAppState();
}

class _BiolocatorAppState extends State<BiolocatorApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Home Screen"),
    );
  }
}
