import 'dart:html';

import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.appTitle}) : super(key: key);
  final String appTitle;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();

  final TextEditingController _urlController = TextEditingController();

  final sentiment = Sentiment();

  bool loading = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Center(child: Text(widget.appTitle))),
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
                    const SizedBox(
                      width: 400,
                      child: Image(image: AssetImage('assets/hs.png')),
                    ),
                    const Text(
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
                      "Enter text:",
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
                        hintText: 'Paste text here',
                      ),
                      controller: _textController,
                      maxLines: 10,
                      minLines: 10,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Or enter a URL:",
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
                        hintText: 'Paste URL here',
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
                      onPressed: () async {
                        int textScore = -100;
                        int urlScore = -100;
                        if (_textController.text.isNotEmpty) {
                          textScore =
                              sentiment.analysis(_textController.text)['score'];
                        }

                        if (_urlController.text.isNotEmpty) {
                          final String encoded =
                              Uri.encodeComponent(_urlController.text);
                          final uri = Uri.parse(
                              'https://dart-scraper.herokuapp.com/scrape/$encoded');
                          setState(() {
                            loading = true;
                          });
                          final response = await http.get(uri);

                          urlScore = sentiment.analysis(response.body)['score'];

                          setState(() {
                            loading = false;
                          });
                        }

                        if (textScore != -100 || urlScore != -100) {
                          context.go(
                            '/score?textScore=$textScore&urlScore=$urlScore',
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: !loading
                            ? const Text(
                                'CHECK SENTIMENT!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 28,
                                ),
                              )
                            : const CircularProgressIndicator(
                                color: Colors.greenAccent),
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
