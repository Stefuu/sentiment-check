import 'dart:html';

import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.appTitle}) : super(key: key);
  final String appTitle;
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Center(child: Text(appTitle))),
        body: Container(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 400,
                      child: const Image(image: AssetImage('assets/hs.png')),
                    ),
                    Text(
                      "Check text or a URL to find out beforehand how much positive or negative feelings the read may bring you",
                      style: TextStyle(
                        color: Color.fromARGB(255, 77, 77, 77),
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Papirus',
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 60),
                    const Text(
                      "Input text:",
                      style: TextStyle(
                        color: Color.fromARGB(255, 77, 77, 77),
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Papirus',
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: const InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter text',
                      ),
                      controller: _textController,
                      maxLines: 10,
                      minLines: 10,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Or input a URL:",
                      style: TextStyle(
                        color: Color.fromARGB(255, 77, 77, 77),
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Papirus',
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _urlController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a URL',
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "And let's check how this text may affect your feelings",
                      style: TextStyle(
                        color: Color.fromARGB(255, 77, 77, 77),
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Papirus',
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        final sentiment = Sentiment();

                        print(sentiment.analysis(_textController.text));

                        //context.go('/score');
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'CHECK SENTIMENT',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Papirus',
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
