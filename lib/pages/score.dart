import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScorePage extends StatelessWidget {
  const ScorePage(
      {Key? key, required this.appTitle, this.urlScore, this.textScore})
      : super(key: key);
  final appTitle;
  final urlScore;
  final textScore;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(appTitle)),
        body: Builder(builder: (context) {
          return Container(
            height: double.infinity,
            color: const Color.fromARGB(255, 234, 234, 234),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        offset: Offset.zero,
                        blurRadius: 4.0,
                        spreadRadius: 4.0),
                  ],
                ),
                width: 600,
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (int.parse(urlScore) != -100)
                          Text(
                            'Score from URL: $urlScore',
                            style: const TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        if (int.parse(textScore) != -100)
                          Text(
                            'Score from text: $textScore',
                            style: const TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ElevatedButton(
                          onPressed: () {
                            context.go('/');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              '<- BACK TO HOME',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 28,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      );
}
