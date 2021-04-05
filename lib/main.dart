import 'package:flutter/material.dart';

import 'mess_chat_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Chat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int RIGHT = 0;
  final int LEFT = 1;
  final String StringEmpty = '';
  TextEditingController _chatController = new TextEditingController();
  List<MessChatModel> listDataMessChat = <MessChatModel>[];

  @override
  void initState() {
    super.initState();

    listDataMessChat.add(new MessChatModel("Hi", DateTime.now(), RIGHT));
    listDataMessChat
        .add(new MessChatModel("Co khoe khong?", DateTime.now(), RIGHT));
    listDataMessChat
        .add(new MessChatModel("Minh khoe!", DateTime.now(), LEFT));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                constraints: BoxConstraints.expand(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                          itemCount: listDataMessChat.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            if (listDataMessChat[index].type == LEFT) {
                              return viewLeft(listDataMessChat[index]);
                            }
                            if (listDataMessChat[index].type == RIGHT) {
                              return viewRight(listDataMessChat[index]);
                            }
                            return Container();
                          }),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: _chatController,
                              onSubmitted: (value) => enterText(value) ,
                              style: TextStyle(fontSize: 20),
                              decoration: new InputDecoration.collapsed(
                                  hintText: 'Chat here'),
                            ),
                          ),
                          RaisedButton(
                              onPressed: () => _sendMsg(),
                              color: Colors.blue,
                              child: Text("SEND",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)))
                        ])
                  ],
                )
            )
        )
    );
  }

  Widget viewLeft(MessChatModel chatModel) {
    return Container(
      alignment: Alignment.topLeft,
      color: Colors.blue,
      width: 150,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(chatModel.mess),
            Text(chatModel.timeChat)],
        ),
      ),
    );
  }

  Widget viewRight(MessChatModel chatModel) {
    return Container(
      alignment: Alignment.topRight,
      color: Colors.deepOrange,
      width: 150,
      height: 50,
      child: Column(
        children: <Widget>[
          Text(chatModel.mess),
          Text(chatModel.timeChat)
        ],
      ),
    );
  }

  void addChat(text){
    if (text != null && text.trim() != StringEmpty) {
      listDataMessChat
          .add(new MessChatModel(text, DateTime.now(), LEFT));
    }
    _chatController.text = StringEmpty;
    setState(() {});
  }

  void _sendMsg() {
    addChat(_chatController.text);
  }

  void enterText(value){
    addChat(value);
  }
}
