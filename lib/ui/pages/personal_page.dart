import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  final int number;

  PersonalPage({this.number}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal"),
      ),
      body: Center(
        child: Text('My number is: $number'),
      ),
    );
  }
}