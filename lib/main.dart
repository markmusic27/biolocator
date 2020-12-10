import 'package:flutter/material.dart';

void main() {
  runApp(BiolocatorApp());
}

class BiolocatorApp extends StatefulWidget {
  @override
  _BiolocatorAppState createState() => _BiolocatorAppState();
}

class _BiolocatorAppState extends State<BiolocatorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
