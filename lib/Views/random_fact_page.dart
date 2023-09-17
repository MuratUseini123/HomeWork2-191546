import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Model/ScienceFactModel.dart';

class RandomFactPage extends StatefulWidget {
  @override
  _RandomFactPageState createState() => _RandomFactPageState();
}

class _RandomFactPageState extends State<RandomFactPage> {
  ScienceFact _fact = ScienceFact(
    fact: "Loading...",
    type: "",
    category: "",
    date: "",
    number: "",
    related: "",
  );

  Future<void> _fetchRandomScienceFact() async {
    try {
      final response = await http.get(Uri.parse("http://numbersapi.com/random/trivia"));

      if (response.statusCode == 200) {
        final jsonFact = json.decode(response.body);
        if (jsonFact['text'] != null && jsonFact['type'] != null) {
          final scienceFact = ScienceFact.fromJson(jsonFact);
          setState(() {
            _fact = scienceFact;
          });
        } else {
          _handleError("Invalid data received from API");
        }
      } else {
        _handleError("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      _handleError("An error occurred: $e");
    }
  }

  void _handleError(String errorMessage) {
    setState(() {
      _fact = ScienceFact(
        fact: errorMessage,
        type: "",
        category: "",
        date: "",
        number: "",
        related: "",
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchRandomScienceFact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Random Science Fact'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Random Science Fact",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Type: ${_fact.type}",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              "Category: ${_fact.category}",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              "Date: ${_fact.date}",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              "Number: ${_fact.number}",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              "Related: ${_fact.related}",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchRandomScienceFact,
              child: Text("Fetch New Fact"),
            ),
          ],
        ),
      ),
    );
  }
}