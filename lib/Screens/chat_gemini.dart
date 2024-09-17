import 'package:doctor_booking_app/bloc/chat_bot_bloc.dart';
import 'package:doctor_booking_app/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ChatGemini extends StatefulWidget {
  const ChatGemini({super.key});

  @override
  State<ChatGemini> createState() => _ChatGeminiState();
}

class _ChatGeminiState extends State<ChatGemini> {
  final ChatBotBloc chatBotBloc = ChatBotBloc();
  TextEditingController textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    textEditingController.dispose();
    chatBotBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      extendBody: false,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 41, 50, 140),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: const Text(
            'HealthMate Help',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: BlocConsumer<ChatBotBloc, ChatBotState>(
        bloc: chatBotBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages =
                  (state as ChatSuccessState).messages;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
              return Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white.withOpacity(0.9),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          bool isUser = messages[index].role == 'user';
                          return Align(
                            alignment: isUser
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              decoration: BoxDecoration(
                                color: isUser
                                    ? Color.fromARGB(255, 41, 50, 140)
                                    : Colors.grey[200],
                                borderRadius:
                                    BorderRadius.circular(12).copyWith(
                                  bottomLeft: isUser
                                      ? const Radius.circular(12)
                                      : const Radius.circular(0),
                                  bottomRight: isUser
                                      ? const Radius.circular(0)
                                      : const Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isUser ? "You" : "HealthMate Bot",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: isUser
                                          ? Colors.white
                                          : Colors.blueGrey,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    messages[index].parts.first.text,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          isUser ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (chatBotBloc.generating)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Lottie.asset('assets/Images/loader.json'),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Loading...',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              style: const TextStyle(color: Colors.black),
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                hintText: 'Ask Something...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              if (textEditingController.text.isNotEmpty) {
                                String text = textEditingController.text;
                                textEditingController.clear();
                                chatBotBloc.add(ChatGenerateNewTextMessageEvent(
                                    inputMessage: text));
                              }
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Color.fromARGB(255, 41, 50, 140),
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
