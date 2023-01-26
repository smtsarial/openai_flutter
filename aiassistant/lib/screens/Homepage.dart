import 'package:aiassistant/helpers/chat-gpt.dart';
import 'package:aiassistant/helpers/firestore.dart';
import 'package:aiassistant/main.dart';
import 'package:aiassistant/models/ChatMessage.dart';
import 'package:aiassistant/screens/ChatMessageWidget.dart';
import 'package:aiassistant/screens/Drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  bool isLoading = false;
  bool showSubscribeWarning = false;

  @override
  void initState() {
    _prefs.then((value) => {checkUserHasRight()});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Assistant'),
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      ),
      drawer: DrawerWidget(),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: showSubscribeWarning
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_outlined,
                      size: 50,
                      color: const Color.fromRGBO(16, 163, 127, 1),
                    ),
                    Container(
                      padding: const EdgeInsets.all(35.0),
                      child: Text(
                        'You have reached your free limit of 3 requests in 24h please subscribe to our service to get the full experience of your individual AI assistant.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(16, 163, 127, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                      ),
                      onPressed: () {},
                      child: const Text('Subscribe'),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  _messages.length > 0
                      ? Expanded(
                          child: _buildList(),
                        )
                      : noInputWidget(),
                  Visibility(
                    visible: isLoading,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildInput(),
                        _buildSubmit(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: Container(
        color: botBackgroundColor,
        child: IconButton(
          icon: const Icon(
            Icons.send_rounded,
            color: Color.fromRGBO(142, 142, 160, 1),
          ),
          onPressed: () async {
            setState(
              () {
                _messages.add(
                  ChatMessage(
                    text: _textController.text,
                    chatMessageType: ChatMessageType.user,
                  ),
                );
                isLoading = true;
              },
            );
            var input = _textController.text;
            _textController.clear();
            Future.delayed(const Duration(milliseconds: 50))
                .then((_) => _scrollDown());
            generateResponse(input).then((value) {
              setState(() {
                isLoading = false;
                _messages.add(
                  ChatMessage(
                    text: value,
                    chatMessageType: ChatMessageType.bot,
                  ),
                );
              });
            });
            _textController.clear();
            checkUserHasRight();
            Future.delayed(const Duration(milliseconds: 50))
                .then((_) => _scrollDown());
          },
        ),
      ),
    );
  }

  Expanded _buildInput() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(color: Colors.white),
        controller: _textController,
        decoration: const InputDecoration(
          fillColor: botBackgroundColor,
          filled: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  ListView _buildList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        var message = _messages[index];
        return ChatMessageWidget(
          text: message.text,
          chatMessageType: message.chatMessageType,
        );
      },
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Widget noInputWidget() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.flag_circle_sharp,
              color: Colors.grey, size: MediaQuery.of(context).size.width / 9),
          SizedBox(height: 10),
          Text('Questions',
              style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(height: 10),
          Container(
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 30),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.grey[800]!),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                '"How to make an HTTP request in Javascript?"',
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              )),
          SizedBox(height: 10),
          Container(
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 30),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.grey[800]!),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                '"Got any creative ideas for a 10 years old\'s Birthday?"',
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              )),

          /////////
          ///
          SizedBox(height: 20),
          Icon(Icons.edit,
              color: Colors.grey, size: MediaQuery.of(context).size.width / 9),
          SizedBox(height: 10),
          Text('Write & Edit',
              style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(height: 10),
          Container(
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 30),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.grey[800]!),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                '"Write a tweet about electric vehicles"',
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              )),
          SizedBox(height: 10),
          Container(
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 30),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.grey[800]!),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                '"Write a rap song about broccoli"',
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }

  checkUserHasRight() async {
    final SharedPreferences prefs = await _prefs;
    final String? userUid = prefs.getString('userUid');
    FirestoreHelper.checkUserHasAvaliable(userUid!).then((value) {
      if (!value) {
        setState(() {
          showSubscribeWarning = true;
        });
      } else {
        setState(() {
          showSubscribeWarning = false;
        });
      }
    });
  }
}
