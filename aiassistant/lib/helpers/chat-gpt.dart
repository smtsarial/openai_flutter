import 'dart:convert';
import 'dart:convert';

import 'package:aiassistant/helpers/firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String> generateResponse(String prompt) async {
  try {
    const apiKey = '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';
    //get user id from shared preferences
    var prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('userId');
// https://api.pawan.krd/v1/chat/completions
    var url = Uri.https("api.pawan.krd", "/v1/chat/completions");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $apiKey"
      },
      body: json.encode({
        "model": "text-davinci-003",
        "prompt": prompt,
        'temperature': 0.9,
        'max_tokens': 2000,
        'top_p': 1,
        'frequency_penalty': 0.0,
        'presence_penalty': 0.0,
      }),
    );

    print('*****************' + response.body);
    // Do something with the response
    Map<String, dynamic> newresponse = jsonDecode(response.body);

    //save prompt and response to firestore UserMessages collection for user id
    //get user id from shared preferences
    final String userUid = prefs.getString('userUid')!;

    await FirestoreHelper.saveUserMessage(
        userUid, prompt, newresponse['choices'][0]['text']);
    return newresponse['choices'][0]['text'];
  } catch (e) {
    print(e);
    await FirestoreHelper.saveUserMessage('HYoC6ehqnlE7abCIjlcK', prompt,
        'Sorry, I am not feeling well today. Please try again later.');
    return 'Sorry, I am not feeling well today. Please try again later.';
  }
}
