import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'inner_chat_screen.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: SizedBox(),
        title: const Text(
          "Chat",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                hintText: "Search",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(31),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(31),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (ctx, i) {
                  return ListTile(
                    onTap: () => Get.to(InnerChat()),
                    contentPadding: EdgeInsets.zero,
                    leading: Stack(
                      children: [
                        CircleAvatar(
                            child: Image.asset(
                              'assets/images/chat_img.png',
                              fit: BoxFit.cover,
                            )),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 9.11,
                            height: 9.11,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              color: Color(0xff64dd17),
                            ),
                          ),
                        )
                      ],
                    ),
                    title: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Buyer",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          width: 6.06,
                          height: 6.06,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff00ff00),
                                Color(0xff00ff00),
                                Color(0xff00ff00)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "I love the car",
                            style: TextStyle(
                              color: Color(0xff757575),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          "9:27 AM",
                          style: TextStyle(
                            color: Color(0xff9e9e9e),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
