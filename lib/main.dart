import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StartupNameGenerator());
}

class StartupNameGenerator extends StatelessWidget {
  const StartupNameGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Startup Name Generator',
      home: StartupNameGeneratorHomePage(title: 'Startup Name Generator'),
    );
  }
}

class StartupNameGeneratorHomePage extends StatefulWidget {
  const StartupNameGeneratorHomePage({super.key, required this.title});

  final String title;

  @override
  State<StartupNameGeneratorHomePage> createState() =>
      _StartupNameGeneratorHomePageState();
}

class _StartupNameGeneratorHomePageState
    extends State<StartupNameGeneratorHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Startup Name Generator'),
          ),
          body: const Center(
            child: RandomWords(),
          )),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
}
