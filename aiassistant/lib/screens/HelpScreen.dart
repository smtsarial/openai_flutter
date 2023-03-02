import 'package:aiassistant/screens/ChatMessageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HELP'),
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Help',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 20),
              ExpansionTile(
                textColor: Colors.white,
                title: Text(
                  "What is My AI Assistant?",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ), //header title
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Text(
                        "My AI Assistant is an artificial intelligence-based chatbot application trained on the OpenAI GPT-3 model. It is capable of responding to a wide range of questions and requests in natural language.",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              ExpansionTile(
                textColor: Colors.white,
                title: Text(
                  "How does My AI Assistant work?",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ), //header title
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Text(
                        "My AI Assistant utilizes the OpenAI GPT-3 model to respond to questions and requests in natural language. When a user inputs a message into the app, the GPT-3 model generates a response based on the input and its training on vast amounts of data.",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              ExpansionTile(
                textColor: Colors.white,
                title: Text(
                  "What types of questions can My AI Assistant answer?",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ), //header title
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Text(
                        "My AI Assistant is capable of answering a wide range of questions, including but not limited to general knowledge questions, conversational queries, and specific requests.",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              ExpansionTile(
                textColor: Colors.white,
                title: Text(
                  "How accurate are My AI Assistant's answers?",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ), //header title
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Text(
                        "The accuracy of My AI Assistant's answers depends on the quality and context of the input, as well as the complexity of the question. However, the GPT-3 model is trained on vast amounts of data and is capable of providing accurate and informative answers for many types of questions.",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              ExpansionTile(
                textColor: Colors.white,
                title: Text(
                  "Is My AI Assistant free to use?",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ), //header title
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Text(
                        "The pricing model for My AI Assistant may vary, and information on pricing plans and available features can be found on the app's website or through the app store.",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              ExpansionTile(
                textColor: Colors.white,
                title: Text(
                  "Is My AI Assistant secure and private?",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ), //header title
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Text(
                        "The security and privacy of user data is a top priority for My AI Assistant. The app implements various security measures and follows privacy policies to protect user information. For more information on security and privacy, please see the app's website or privacy policy.",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    launch(
                        'https://aiassistantgpt.wordpress.com/2023/02/08/ai-assitant-gpt-support/');
                  },
                  child: Text(
                    '''https://aiassistantgpt.wordpress.com/2023/02/08/ai-assitant-gpt-support/''',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('For any other request contact ai.assistant.gpt@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
