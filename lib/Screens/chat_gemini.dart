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
    _scrollController.dispose(); // Dispose ScrollController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'My Doc',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: BlocConsumer<ChatBotBloc, ChatBotState>(
        bloc: chatBotBloc,
        // listenWhen: ,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages =
                  (state as ChatSuccessState).messages;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.8,
                      image: NetworkImage(
                          'https://i.pinimg.com/474x/7b/de/b5/7bdeb59ac67e572286c16718a96c6138.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              bottom: 12,
                              left: 5,
                              right: 5,
                            ),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.blue,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  messages[index].role == "user"
                                      ? "User"
                                      : "ChatBot",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: messages[index].role == 'user'
                                          ? Colors.red.withAlpha(200)
                                          : Colors.brown.shade900),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  messages[index].parts.first.text,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      height: 1.2),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    if (chatBotBloc.generating)
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: Lottie.asset('assets/Images/loader.json'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Loading',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    Container(
                      // height: 90,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                  hintText: 'Ask Something..',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor))),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
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
                              radius: 32,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.shade900,
                                radius: 30,
                                child: Center(
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ),
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
              return SizedBox();
          }
        },
      ),
    );
  }
}
