import 'package:flutter/material.dart';
import 'package:zego_express_engine/zego_express_engine.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zegocloudtest/screen/call_screen.dart';
import 'package:zegocloudtest/util/all_constant.dart';

import '../../helper/zego_call_helper.dart';
import '../../util/all_key.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,required this.callId,required this.userId,required this.username});


  final String callId;
  final String userId;
  final String username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static String callUserId = "";
  @override
  void initState() {
    CallHelper.onUserLogin(widget.username,widget.userId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Printname:${widget.username}');
    print('Printname:${widget.userId}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Screen'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (val) {
          setState(() {
            callUserId = val;
          });

            },
            decoration: InputDecoration(
                hintText: "UserId", border: OutlineInputBorder()),
          ),

        ZegoSendCallInvitationButton(
        isVideoCall: true,
        resourceID: "zegouikit_call",
        invitees: [
          ZegoUIKitUser(
            id: callUserId,
            name: widget.username,
          ),

          // ZegoUIKitUser(
          //   id: widget.userId,
          //   name: widget.username,
          // )
        ],
      ),

          ZegoSendCallInvitationButton(
            isVideoCall: false,
            resourceID: "zegouikit_call",
            invitees: [
              ZegoUIKitUser(
                id: callUserId,
                name: widget.username,
              ),

              // ZegoUIKitUser(
              //   id: widget.userId,
              //   name: widget.username,
              // )
            ],
          ),
          // ElevatedButton(onPressed: (){
          //
          //    CallHelper.onUserLogin(widget.username,widget.userId);
          //
          //    ZegoSendCallInvitationButton(
          //      isVideoCall: true,
          //      resourceID: "zegouikit_call", //You need to use the resourceID that you created in the subsequent steps. Please continue reading this document.
          //      invitees: [
          //        ZegoUIKitUser(
          //          id: widget.userId,
          //          name: widget.username,
          //        ),
          //
          //        // ZegoUIKitUser(
          //        //   id: widget.userId,
          //        //   name: widget.username,
          //        // )
          //      ],
          //    );
          //    // Navigator.push(context, MaterialPageRoute(builder: (_)=>CallScreen(callId:widget.callId,userId:widget.username,username: widget.userId,)));
          //
          // }, child: Text('Call'))
        ],
      ),
    );
  }

}
