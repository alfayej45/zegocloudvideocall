import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zegocloudtest/screen/HomePage/homepage.dart';

import '../helper/zego_call_helper.dart';

class MyLogin extends StatefulWidget {
   MyLogin({Key? key,}) : super(key: key);


  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  static String name = "";
  static String userId = "";
  static String callId="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Login"),
      ),

      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (val) {
               name = val;
              },
              decoration: InputDecoration(
                  hintText: "Name", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (val) {
                userId = val;
              },
              decoration: InputDecoration(
                  hintText: "UserId", border: OutlineInputBorder()),
            ),
            // TextField(
            //   onChanged: (val) {
            //     callId = val;
            //   },
            //   decoration: InputDecoration(
            //       hintText: "call", border: OutlineInputBorder()),
            // ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  CallHelper.onUserLogin(name,userId);
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage(callId:callId,username: name,userId: userId,)));
                 },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}