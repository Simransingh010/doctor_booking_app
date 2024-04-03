import 'package:doctor_booking_app/bloc/chat_bot_bloc.dart';
import 'package:doctor_booking_app/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChatGemini extends StatefulWidget {
  const ChatGemini({super.key});

  @override
  State<ChatGemini> createState() => _ChatGeminiState();
}

class _ChatGeminiState extends State<ChatGemini> {
  final ChatBotBloc chatBotBloc = ChatBotBloc();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                'My Space',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
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
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.1,
                      image: NetworkImage(
                          'https://img.freepik.com/premium-photo/stethoscope-medicine-accessories-black-background-with-copy-space_362520-268.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.amber.withOpacity(0.1),
                            ),
                            child: Text(messages[index].parts.first.text),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor))),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
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
