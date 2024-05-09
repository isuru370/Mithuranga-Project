import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String? name;
  final String? chatRoomId;
  ChatScreen({super.key, this.name, this.chatRoomId});

  TextEditingController _message = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$name"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: db
                    .collection("ChatRoom")
                    .doc(chatRoomId)
                    .collection("chats")
                    .orderBy("time", descending: false)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      //Map<String,dynamic> map =
                      //snapshot.data.docs[index].data();
                      return Container();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Container(
          height: MediaQuery.of(context).size.height / 12,
          width: MediaQuery.of(context).size.width / 1.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width / 1.5,
                child: TextField(
                  controller: _message,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.send))
            ],
          ),
        ),
      ),
    );
  }
}
