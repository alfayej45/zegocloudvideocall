

import 'dart:ffi' as ffi;
import 'dart:ui' as ui;


import 'package:flutter/cupertino.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zegocloudtest/util/all_constant.dart';
import 'package:flutter/material.dart';
import '../main.dart';

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
    channelID: "zego_call",
    channelName: "Call Notifications",
    callIDVisibility: true,
    sound: "call",
    icon: "call",
    ),
      iOSNotificationConfig: ZegoCallIOSNotificationConfig(
      systemCallingIconName: 'CallKitIcon',
    ),
    ),

      requireConfig: (ZegoCallInvitationData data) {
        final config = (data.invitees.length > 1)
            ? ZegoCallType.videoCall == data.type
            ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
            : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
            : ZegoCallType.videoCall == data.type
            ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
            : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

        /// support minimizing, show minimizing button
        config.topMenuBar.isVisible = true;
        config.duration.isVisible = true;
        config.duration.onDurationUpdate = (Duration duration) {
          print('DurationCheck:$duration}');
          if (duration.inSeconds >= 5 * 60) {

            ZegoUIKitPrebuiltCallController().hangUp(navigatorKey.currentState!.context);
            print('DurationCheck:$duration}');

          }
          print('DurationCheck:$duration}');
        };
        config.topMenuBar.buttons
            .insert(0, ZegoCallMenuBarButtonName.minimizingButton);

        config.avatarBuilder = (BuildContext context, Size size,
            ZegoUIKitUser? user, Map extraInfo) {
          return user != null
              ? Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.pngfind.com/pngs/m/470-4703547_icon-user-icon-hd-png-download.png',
                ),
              ),
            ),
          )
              : const SizedBox();
        };
        return config;

      },
    );
  }
  /// on App's user logout
  static onUserLogout() {
    /// 1.2.2. de-initialization ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged out
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }

}



