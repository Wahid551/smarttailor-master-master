import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/chat.dart';
import 'package:smarttailor/Provider/customer_data_provider.dart';
import 'package:smarttailor/customerscreens/ChatBox/conversation.dart';

class Room extends StatefulWidget {
  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  Stream? chatRooms;
  late CustomerProvider _data;
  late String myName;
  @override
  void initState() {
    CustomerProvider data = Provider.of(context, listen: false);
    data.getUserData();
    myName = data.currentUserDataList.firstName +
        " " +
        data.currentUserDataList.lastName;
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    print(myName);
    AuthData().getUserChats(myName).then((snapshots) {
      setState(() {
        chatRooms = snapshots;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${myName}");
      });
    });
  }

  Widget chatRoomsList() {
    return StreamBuilder<dynamic>(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // print(index);
                  return ChatRoomsTile(
                    userName: snapshot.data!.docs[index]
                        .data()['chatRoomId']
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(
                            _data.currentUserDataList.firstName +
                                " " +
                                _data.currentUserDataList.lastName,
                            ""),
                    chatRoomId: snapshot.data.docs[index].data()["chatRoomId"],
                  );
                })
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _data = Provider.of<CustomerProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chat Box'),
      ),
      body: chatRoomsList(),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({required this.userName, required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Conversation(
                      chatRoomId: chatRoomId,
                    )));
      },
      child: Container(
        color: Colors.black26,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Color(0xFF6F35A5),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(userName.substring(0, 1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'OverpassRegular',
                      fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              width: 12,
            ),
            Text(userName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
