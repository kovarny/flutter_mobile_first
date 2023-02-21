import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('blank page'),
        ),
        body: Container());
  }
}
