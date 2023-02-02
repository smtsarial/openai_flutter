import 'package:aiassistant/screens/ChatMessageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Assistant'),
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
