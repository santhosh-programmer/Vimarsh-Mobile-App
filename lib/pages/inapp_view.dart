import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

class InappView extends StatefulWidget {
  const InappView({super.key, required this.meetName});

  final String meetName;

  @override
  State<InappView> createState() => _InappViewState();
}

class _InappViewState extends State<InappView> {
  @override
  void initState() {
    super.initState();
    doSomeWork();
  }

  void doSomeWork() async {
    await Permission.camera.request();
    await Permission.microphone.request();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  double prog = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            width: MediaQuery.sizeOf(context).width * 0.70,
            child: Stack(
              children: [
                if (prog < 1)
                  const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                InAppWebView(
                  onProgressChanged: (controller, progress) {
                    setState(() {
                      prog = progress / 100;
                    });
                  },
                  initialUrlRequest: URLRequest(
                    url: WebUri.uri(
                      Uri.parse("https://meet.jit.si/${widget.meetName}"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                height: 120,
                width: 120,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_up_rounded,
                          size: 35,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 35,
                            color: Colors.black,
                          ),
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 35,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_left_rounded,
                            size: 35,
                            color: Colors.black,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
