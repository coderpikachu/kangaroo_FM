import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final index;
  DetailPage({this.index});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(this.widget.index.toString()),
        ),
      ),
    );
  }
}
