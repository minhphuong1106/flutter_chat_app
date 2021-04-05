class MessChatModel {
  String mess;
  String timeChat;
  DateTime dtChat;
  int type;

  MessChatModel(this.mess, this.dtChat, this.type){
    _toStringDTChat();
  }

  void _toStringDTChat(){
    if (this.dtChat != null){
      timeChat = dtChat.hour.toString() + ":" + dtChat.minute.toString();
    }
  }
}