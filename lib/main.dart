import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Frequency App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 53, 90, 171)),
      ),
      home: const MyHomePage(title: 'Word Frequency App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  // Your list of sentences
  final List<String> _sentences = [
    "This is a Really really is really is cool experiment really",
    "Cute little experiment",
    "Will it work maybe it will work do you think it will it will"
  ];

  // Function to find most frequent words in each sentence
  List<String> findMostFrequentWords() {
    List<String> results = [];

    for (int i = 0; i < _sentences.length; i++) {
      String sentence = _sentences[i].toLowerCase();
      List<String> words = sentence.split(' ');

      Map<String, int> wordCount = {};

      for (var word in words) {
        wordCount[word] = (wordCount[word] ?? 0) + 1;
      }

      int maxCount = wordCount.values.reduce((a, b) => a > b ? a : b);

      List<String> mostFrequent = [];
      wordCount.forEach((word, count) {
        if (count == maxCount) {
          mostFrequent.add(word);
        }
      });

      results.add(
          "Sentence ${i + 1}: Most frequent words are '${mostFrequent.join(", ")}' (count: $maxCount)");
    }

    return results;
  }


  @override
  Widget build(BuildContext context) {
    List<String> mostFrequentWords = findMostFrequentWords();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sentences:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ..._sentences.map((sentence) => Text("- $sentence")),
              const SizedBox(height: 20),
              const Text(
                'Most Frequent Words:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...mostFrequentWords.map((result) => Text(result)),
              const SizedBox(height: 30),
          
            ],
          ),
        ),
      ),
    );
  }
}
