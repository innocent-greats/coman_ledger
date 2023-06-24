// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        centerTitle: false,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
        title: const Text(
          "Contact Umoja Support",
          style: appBarStyle,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(fixPadding * 2.0),
        physics: const BouncingScrollPhysics(),
        children: [
          feedBackTitle(),
          heightSpace,
          heightSpace,
          callInfo(),
          heightSpace,
          height5Space,
          mainInfo(),
          heightSpace,
          heightSpace,
          orText(),
          heightSpace,
          heightSpace,
          nameField(),
          heightSpace,
          heightSpace,
          emailField(),
          heightSpace,
          heightSpace,
          messageField(),
        ],
      ),
      bottomNavigationBar: submitButton(context, size),
    );
  }

  submitButton(BuildContext context, Size size) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(
                  top: fixPadding * 1.5,
                  bottom: fixPadding * 2.0,
                  left: fixPadding * 2.0,
                  right: fixPadding * 2.0),
              padding: const EdgeInsets.all(fixPadding * 1.3),
              width: size.width * 0.75,
              decoration: BoxDecoration(
                  boxShadow: buttonShadow,
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(5.0)),
              child: const Text(
                "Submit Query",
                style: bold18White,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  messageField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Your Message",
          style: semibold15Grey,
        ),
        TextField(
          cursorColor: primaryColor,
          style: bold16Black,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter your message",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lightGreyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Email Address",
          style: semibold15Grey,
        ),
        TextField(
          keyboardType: TextInputType.emailAddress,
          cursorColor: primaryColor,
          style: bold16Black,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter your email address",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lightGreyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  nameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Full Name",
          style: semibold15Grey,
        ),
        TextField(
          keyboardType: TextInputType.name,
          cursorColor: primaryColor,
          style: bold16Black,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter your name",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lightGreyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  orText() {
    return const Text(
      "Or send your message",
      style: bold18Black,
    );
  }

  mainInfo() {
    return Row(
      children: const [
        Icon(
          Icons.mail,
          color: primaryColor,
          size: 22,
        ),
        widthSpace,
        Expanded(
          child: Text(
            "umoja@umoja.io",
            style: semibold16Grey,
          ),
        )
      ],
    );
  }

  callInfo() {
    return Row(
      children: const [
        Icon(
          Icons.call,
          color: primaryColor,
          size: 22,
        ),
        widthSpace,
        Expanded(
          child: Text(
            "+26378654790",
            style: semibold16Grey,
          ),
        )
      ],
    );
  }

  feedBackTitle() {
    return const Text(
      "Let us know your issue & feedback",
      style: bold18Black,
    );
  }
}
