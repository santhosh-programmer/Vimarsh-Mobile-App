import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:vimarsh/pages/inapp_view.dart';

class JitjiPage extends StatefulWidget {
  const JitjiPage({super.key});

  @override
  State<JitjiPage> createState() => _JitjiPageState();
}

class _JitjiPageState extends State<JitjiPage> {
  // bool audioMuted = true;
  // bool videoMuted = true;
  // bool screenShareOn = false;
  List<String> participants = [];
  final _jitsiMeetPlugin = JitsiMeet();

  join() async {
    var options = JitsiMeetConferenceOptions(
      room: "vimarshmeeting",
      configOverrides: {
        "startWithAudioMuted": true,
        "startWithVideoMuted": true,
        "subject": "Vimarsh Live",
      },
      featureFlags: {
        "unsaferoomwarning.enabled": false,
        "ios.screensharing.enabled": false,
        "lobby-mode.enabled": false,
        'meeting-name.enabled': false,
        'notifications.enabled': false,
        'overflow-menu.enabled': false,
        'pip.enabled': false,
        'prejoinpage.enabled': false,
        'raise-hand.enabled': false,
        'reactions.enabled': false,
        'recording.enabled': false,
        'security-options.enabled': false,
        'server-url-change.enabled': false,
        'settings.enabled': false,
        'tile-view.enabled': false,
        'toolbox.enabled': false,
        'video-mute.enabled': false,
        'video-share.enabled': false,
      },
      userInfo: JitsiMeetUserInfo(
        displayName: "Test User",
        email: "testuser@gmail.com",
        avatar: "https://avatars.githubusercontent.com/u/57035818?s=400&u=02572f10fe61bca6fc20426548f3920d53f79693&v=4",
      ),
    );

    var listener = JitsiMeetEventListener(
      conferenceJoined: (url) {
        debugPrint("conferenceJoined: url: $url");
      },
      conferenceTerminated: (url, error) {
        debugPrint("conferenceTerminated: url: $url, error: $error");
      },
      conferenceWillJoin: (url) {
        debugPrint("conferenceWillJoin: url: $url");
      },
      participantJoined: (email, name, role, participantId) {
        debugPrint(
          "participantJoined: email: $email, name: $name, role: $role, "
          "participantId: $participantId",
        );
        participants.add(participantId!);
      },
      participantLeft: (participantId) {
        debugPrint("participantLeft: participantId: $participantId");
      },
      audioMutedChanged: (muted) {
        debugPrint("audioMutedChanged: isMuted: $muted");
      },
      videoMutedChanged: (muted) {
        debugPrint("videoMutedChanged: isMuted: $muted");
      },
      endpointTextMessageReceived: (senderId, message) {
        debugPrint("endpointTextMessageReceived: senderId: $senderId, message: $message");
      },
      screenShareToggled: (participantId, sharing) {
        debugPrint(
          "screenShareToggled: participantId: $participantId, "
          "isSharing: $sharing",
        );
      },
      chatMessageReceived: (senderId, message, isPrivate, timestamp) {
        debugPrint(
          "chatMessageReceived: senderId: $senderId, message: $message, "
          "isPrivate: $isPrivate, timestamp: $timestamp",
        );
      },
      chatToggled: (isOpen) => debugPrint("chatToggled: isOpen: $isOpen"),
      participantsInfoRetrieved: (participantsInfo) {
        debugPrint("participantsInfoRetrieved: participantsInfo: $participantsInfo, ");
      },
      readyToClose: () {
        debugPrint("readyToClose");
      },
    );
    await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    await _jitsiMeetPlugin.join(options, listener);
  }

  hangUp() async {
    await _jitsiMeetPlugin.hangUp();
  }

  closeChat() async {
    await _jitsiMeetPlugin.closeChat();
  }

  // retrieveParticipantsInfo() async {
  //   var a = await _jitsiMeetPlugin.retrieveParticipantsInfo();
  //   debugPrint("$a");
  // }

  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Enter Room ID",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                    controller: controller,
                    autocorrect: false,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 18, 32, 63),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: join,
                      child: const Text(
                        "METHOD 1",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InappView(meetName: controller.text),
                            )).then((_) async {
                          await SystemChrome.setPreferredOrientations([
                            DeviceOrientation.portraitUp,
                            DeviceOrientation.landscapeLeft,
                            DeviceOrientation.landscapeRight,
                          ]);
                        });
                      },
                      child: const Text(
                        "METHOD 2",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              // TextButton(onPressed: hangUp, child: const Text("Hang Up")),
              // Row(children: [
              //   const Text("Set Audio Muted"),
              //   Checkbox(
              //     value: audioMuted,
              //     onChanged: setAudioMuted,
              //   ),
              // ]),
              // Row(children: [
              // const Text("Set Video Muted"),
              // Checkbox(
              //   value: videoMuted,
              //   onChanged: setVideoMuted,
              // ),
              // ]),
              // TextButton(onPressed: sendEndpointTextMessage, child: const Text("Send Hey Endpoint Message To All")),
              // Row(children: [
              // const Text("Toggle Screen Share"),
              // Checkbox(
              //   value: screenShareOn,
              //   onChanged: toggleScreenShare,
              // ),
              // ]),
              // TextButton(onPressed: openChat, child: const Text("Open Chat")),
              // TextButton(onPressed: sendChatMessage, child: const Text("Send Chat Message to All")),
              // TextButton(onPressed: closeChat, child: const Text("Close Chat")),
              // TextButton(onPressed: retrieveParticipantsInfo, child: const Text("Retrieve Participants Info")),
            ],
          ),
        ),
      ),
    );
  }
}
