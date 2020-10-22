import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Second Page"),
      ),
      body: Center(
        child: Text("walcome Admin silahkan lanjutkan kerja anda"),
      ),
    );
  }
}
