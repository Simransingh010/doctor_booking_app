import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctor_booking_app/models/chat_message_model.dart';
import 'package:doctor_booking_app/repos/chat_repository.dart';
import 'package:meta/meta.dart';

part 'chat_bot_event.dart';
part 'chat_bot_state.dart';

class ChatBotBloc extends Bloc<ChatBotEvent, ChatBotState> {
  ChatBotBloc() : super(ChatSuccessState(messages: const [])) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }
  List<ChatMessageModel> messsages = [];
  bool generating = false;

  FutureOr<void> chatGenerateNewTextMessageEvent(
      ChatGenerateNewTextMessageEvent event, Emitter<ChatBotState> emit) async {
    messsages.add(ChatMessageModel(
        role: 'user', parts: [ChatPartModel(text: event.inputMessage)]));
    emit(ChatSuccessState(messages: messsages));

    generating = true;

    String generatedText = await ChatRepo.chatTextGenerationRepo(messsages);

    // ignore: prefer_is_empty
    if (generatedText.length > 0) {
      messsages.add(ChatMessageModel(
          role: 'model', parts: [ChatPartModel(text: generatedText)]));
      emit(ChatSuccessState(messages: messsages));
    }
    generating = false;
  }
}
