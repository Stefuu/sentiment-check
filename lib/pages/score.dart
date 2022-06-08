import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key, required this.appTitle}) : super(key: key);
  final appTitle;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(appTitle)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('Score')],
          ),
        ),
      );
}
