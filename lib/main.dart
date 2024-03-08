import 'package:flutter/material.dart';
import 'package:zego_express_engine/zego_express_engine.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zegocloudtest/helper/zego_call_helper.dart';
import 'package:zegocloudtest/screen/loginpage.dart';
import 'package:zegocloudtest/util/all_constant.dart';
import 'package:zegocloudtest/util/all_key.dart';

 late GlobalKey<NavigatorState> navigatorKey;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 1.1.2: set navigator key to ZegoUIKitPrebuiltCallInvitationService
  navigatorKey=GlobalKey<NavigatorState>();
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );
     runApp(MyApp(navigatorKey: navigatorKey));
  });

  //runApp(MyApp(navigatorKey: navigatorKey));

}

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const MyApp({super.key,required this.navigatorKey});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //  @override
  // void initState() {
  //   super.initState();
  //
  //   // Call the method to initialize ZegoUIKitPrebuiltCallInvitationService after login
  //   _initializeZegoUIKitPrebuiltCallInvitationService();
  // }
  //
  // // Method to initialize ZegoUIKitPrebuiltCallInvitationService
  // void _initializeZegoUIKitPrebuiltCallInvitationService() async {
  //   await ZegoUIKit().initLog();
  //   ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(widget.navigatorKey);
  //   ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
  //     [ZegoUIKitSignalingPlugin()],
  //   );
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('KeyPrint${widget.navigatorKey}');
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: widget.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyLogin(),
    );
  }
}

