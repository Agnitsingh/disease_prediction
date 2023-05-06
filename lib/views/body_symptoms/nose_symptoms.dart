import 'package:disease_symptoms/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:disease_symptoms/views/home_body/body_part.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:disease_symptoms/consts/colors.dart';
import 'package:disease_symptoms/views/prediction_screen/prediction_page.dart';

class NoseSymptomPage extends StatefulWidget {
  @override
  _NoseSymptomPageState createState() => _NoseSymptomPageState();
}

class _NoseSymptomPageState extends State<NoseSymptomPage> {
  Map<String, bool?> selectedSymptoms = {
    "Breathlessness": false,
    "Cough": false,
    "Continous Sneezing": false,
    "Throat Irritation": false,
    "Phlegm": false,
    "Sinus Pressure": false,
    "Runny Nose": false,
    "Chest Pain": false,
    "Congestion": false,
    "Mucoid Sputum": false,
    "Mild Fever": false,
    "Rusty Sputum": false,
  };

  String prediction = "";

  void submitSymptoms() async {
    // Create the JSON payload
    Map<String, int> payload = {};
    selectedSymptoms.forEach((symptom, value) {
      payload[symptom] = value == true ? 1 : 0;
    });

    // Make the POST request
    var response = await http.post(
      Uri.parse("http://10.7.16.14:5000/predict"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(payload),
    );

    // Handle the response
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        prediction = data['prediction'];
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(prediction),
        ),
      );
    } else {
      setState(() {
        prediction = "Error: ${response.statusCode}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenThree,
      appBar: AppBar(
        title: Text(
          "Nose",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: selectedSymptoms.keys.map((symptom) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSymptoms[symptom] =
                  !(selectedSymptoms[symptom] ?? false);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedSymptoms[symptom] == true
                      ? lightYellow
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    symptom,
                    style: const TextStyle(
                      color: greenThree,
                      fontFamily: bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitSymptoms,
        child: Icon(Icons.check),
      ),
    );
  }
}

