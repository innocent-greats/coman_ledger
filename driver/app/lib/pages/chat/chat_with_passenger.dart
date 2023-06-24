import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class ChatWithPassenger extends StatefulWidget {
  const ChatWithPassenger({super.key});

  @override
  State<ChatWithPassenger> createState() => _ChatWithPassengerState();
}

class _ChatWithPassengerState extends State<ChatWithPassenger> {
  TextEditingController messageController = TextEditingController();

  final messageList = [
    {"message": "Hello, are you nearby?", "time": "11:00 am", "isUser": true},
    {"message": "i’m at vinmark store", "time": "11:01 am", "isUser": false},
    {
      "message": "Oky, i’ll be there in a few mins.",
      "time": "11:02 am",
      "isUser": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        shadowColor: blackColor.withOpacity(0.25),
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tynisha Obey",
              style: appBarStyle,
            ),
            Text(
              "Online",
              style: semibold14Grey,
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 22,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              padding: const EdgeInsets.only(
                  top: fixPadding,
                  right: fixPadding * 2.0,
                  left: fixPadding * 2.0),
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                int reverseindex = messageList.length - 1 - index;
                return messageList[reverseindex]['isUser'] == true
                    ? userMessages(reverseindex)
                    : passengerMessages(reverseindex);
              },
            ),
          ),
          messageField(),
        ],
      ),
    );
  }

  passengerMessages(int reverseindex) {
    return Container(
      width: double.maxFinite,
      margin:
          const EdgeInsets.only(top: fixPadding, bottom: fixPadding, right: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          image(reverseindex, "assets/chat/passange.png"),
          widthSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: fixPadding, horizontal: fixPadding * 1.5),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0)),
                      color: greyF0Color),
                  child: Text(
                    messageList[reverseindex]['message'].toString(),
                    overflow: TextOverflow.visible,
                    style: semibold15Black,
                  ),
                ),
                height5Space,
                Text(
                  messageList[reverseindex]['time'].toString(),
                  style: bold12Grey,
                ),
                height5Space,
              ],
            ),
          ),
        ],
      ),
    );
  }

  userMessages(int reverseindex) {
    return Container(
      width: double.maxFinite,
      margin:
          const EdgeInsets.only(top: fixPadding, bottom: fixPadding, left: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: fixPadding, horizontal: fixPadding * 1.5),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0)),
                      color: primaryColor),
                  child: Text(
                    messageList[reverseindex]['message'].toString(),
                    overflow: TextOverflow.visible,
                    style: semibold15White,
                  ),
                ),
                height5Space,
                Text(
                  messageList[reverseindex]['time'].toString(),
                  style: bold12Grey,
                )
              ],
            ),
          ),
          widthSpace,
          image(reverseindex, "assets/chat/User.png"),
        ],
      ),
    );
  }

  image(int index, String image) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.25),
            blurRadius: 6,
          )
        ],
      ),
    );
  }

  messageField() {
    return Container(
      margin: const EdgeInsets.all(fixPadding * 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: lightGreyColor),
      ),
      child: TextField(
        controller: messageController,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 1.5, vertical: fixPadding * 1.4),
          hintText: "Type a message...",
          hintStyle: semibold14Grey,
          suffixIcon: IconButton(
            onPressed: () {
              if (messageController.text.isNotEmpty) {
                setState(() {
                  messageList.add({
                    "message": messageController.text,
                    "time": "11:03 am",
                    "isUser": true
                  });
                });
              }
              messageController.clear();
            },
            icon: const Icon(
              Icons.send,
              color: primaryColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
