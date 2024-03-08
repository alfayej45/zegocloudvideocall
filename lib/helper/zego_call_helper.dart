

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zegocloudtest/util/all_constant.dart';

import '../screen/loginpage.dart';

class CallHelper{

  /// on App's user login
  static onUserLogin(String name,userid) {
    /// 1.2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged in or re-logged in
    /// We recommend calling this method as soon as the user logs in to your app.
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: AppId.AppID /*input your AppID*/,
      appSign: AppId.AppSign /*input your AppSign*/,
      userID: userid,
      userName:name,
      plugins: [
        ZegoUIKitSignalingPlugin()
      ],
    uiConfig: ZegoCallInvitationUIConfig(
      acceptButton: ZegoCallButtonUIConfig(
        visible: true,
        icon: Text('call')
          //fff this


      )

    ),

    notificationConfig: ZegoCallInvitationNotificationConfig(

    androidNotificationConfig: ZegoCallAndroidNotificationConfig(
    showFullScreen: true,
    channelID: "ZegoUIKit",
    channelName: "Call Notifications",
    callIDVisibility: true,
    sound: "call",
    icon: "call",
    ),
      iOSNotificationConfig: ZegoCallIOSNotificationConfig(
      systemCallingIconName: 'CallKitIcon',
    ),
    ),

      // requireConfig: (ZegoCallInvitationData data) {
      //   final config = (data.invitees.length > 1)
      //       ? ZegoCallType.videoCall == data.type
      //       ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
      //       : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
      //       : ZegoCallType.videoCall == data.type
      //       ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
      //       : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();
      //
      //   /// support minimizing, show minimizing button
      //   config.topMenuBar.isVisible = true;
      //   config.topMenuBar.buttons
      //       .insert(0, ZegoCallMenuBarButtonName.minimizingButton);
      //
      //   return config;
      // },
    );
  }

  /// on App's user logout
  static onUserLogout() {
    /// 1.2.2. de-initialization ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged out
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }








}



