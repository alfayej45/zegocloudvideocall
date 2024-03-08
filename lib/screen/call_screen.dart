import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zegocloudtest/screen/loginpage.dart';
import 'package:zegocloudtest/util/all_constant.dart';

class CallScreen extends StatelessWidget {
   final String callId;
   final String userId;
   final String username;
  const CallScreen({super.key,required this.callId,required this.userId,required this.username});

  @override
  Widget build(BuildContext context) {

    return ZegoUIKitPrebuiltCall(
      appID: AppId.AppID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: AppId.AppSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userId,
      userName: username,
      callID: callId,
      plugins: [
        ZegoUIKitSignalingPlugin()
        //ffff
        //fff
        //ffff
        //fff
        //ffff
        //fff
      ],
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()

    ..topMenuBarConfig.isVisible = true

    );;
  }

  //joinCall(String callid){

    // ZegoUIKitPrebuiltCallInvitationService().init(
    //
    // notificationConfig: ZegoCallInvitationNotificationConfig(
    // androidNotificationConfig: ZegoCallAndroidNotificationConfig(
    // showFullScreen: true,
    // ),
    // ),
    //
    // );

 // }
}
