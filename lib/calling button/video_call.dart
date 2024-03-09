
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:flutter/material.dart';



Widget CustomCallButton(
    String callId,
    String callName,
     bool calltype,
    ){
  return  ZegoSendCallInvitationButton(
    isVideoCall: calltype,
    resourceID: "zegouikit_call",
    // icon: ButtonIcon(
    //   icon:Icon(iconbutton),
    // ),
    invitees: [
      ZegoUIKitUser(
        id: callId,
        name: callName,
      ),
      // ZegoUIKitUser(
      //   id: widget.userId,
      //   name: widget.username,
      // )
    ],
  );
}