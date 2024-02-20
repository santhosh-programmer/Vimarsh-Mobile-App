import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

class CloudFareVieww extends StatefulWidget {
  const CloudFareVieww({
    super.key,
  });

  @override
  State<CloudFareVieww> createState() => _CloudFareViewwState();
}

class _CloudFareViewwState extends State<CloudFareVieww> {
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

  String endpoint = "live";

  @override
  Widget build(BuildContext context) {
    log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    log(endpoint);
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: InAppWebView(
                onProgressChanged: (controller, progress) {
                  setState(() {
                    prog = progress / 100;
                  });
                },
                initialUrlRequest: URLRequest(
                  url: WebUri.uri(
                    Uri.parse("https://camera.viyugha.tech/$endpoint"),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: const Text("Change View"),
                        contentPadding: const EdgeInsets.all(10),
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                endpoint = "live";
                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 150,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: endpoint == "live" ? const Color.fromARGB(255, 31, 53, 100) : const Color.fromARGB(255, 23, 36, 65),
                              ),
                              child: Text(
                                "Normal",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: endpoint == "live" ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          InkWell(
                            onTap: () {
                              setState(() {
                                endpoint = "disaster";
                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 150,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: endpoint == "disaster" ? const Color.fromARGB(255, 31, 53, 100) : const Color.fromARGB(255, 23, 36, 65),
                              ),
                              child: Text(
                                "Disaster",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: endpoint == "disaster" ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          InkWell(
                            onTap: () {
                              setState(() {
                                endpoint = "riot";
                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 150,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: endpoint == "riot" ? const Color.fromARGB(255, 31, 53, 100) : const Color.fromARGB(255, 23, 36, 65),
                              ),
                              child: Text(
                                "Riot",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: endpoint == "disaster" ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Change View",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.wifi_tethering),
                            Text("Drone"),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt),
                    ),
                  ],
                ),
                SizedBox(
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
              ],
            ),
          )
        ],
      ),
    );
  }
}


  // Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             InkWell(
  //               onTap: () {
  //                 setState(() {
  //                   endpoint = "live";
  //                 });
  //               },
  //               child: Container(
  //                 width: 150,
  //                 margin: const EdgeInsets.symmetric(horizontal: 5),
  //                 padding: const EdgeInsets.all(10),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(10),
  //                   color: endpoint == "live" ? const Color.fromARGB(255, 31, 53, 100) : const Color.fromARGB(255, 23, 36, 65),
  //                 ),
  //                 child: Text(
  //                   "Normal",
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                     fontWeight: endpoint == "live" ? FontWeight.bold : FontWeight.normal,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             InkWell(
  //               onTap: () {
  //                 setState(() {
  //                   endpoint = "disaster";
  //                 });
  //               },
  //               child: Container(
  //                 width: 150,
  //                 margin: const EdgeInsets.symmetric(horizontal: 5),
  //                 padding: const EdgeInsets.all(10),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(10),
  //                   color: endpoint == "disaster" ? const Color.fromARGB(255, 31, 53, 100) : const Color.fromARGB(255, 23, 36, 65),
  //                 ),
  //                 child: Text(
  //                   "Disaster",
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                     fontWeight: endpoint == "disaster" ? FontWeight.bold : FontWeight.normal,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             InkWell(
  //               onTap: () {
  //                 setState(() {
  //                   endpoint = "riot";
  //                 });
  //               },
  //               child: Container(
  //                 width: 150,
  //                 margin: const EdgeInsets.symmetric(horizontal: 5),
  //                 padding: const EdgeInsets.all(10),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(10),
  //                   color: endpoint == "riot" ? const Color.fromARGB(255, 31, 53, 100) : const Color.fromARGB(255, 23, 36, 65),
  //                 ),
  //                 child:  Text(
  //                   "Riot",
  //                   textAlign: TextAlign.center,
  //                    style: TextStyle(
  //                     fontWeight: endpoint == "disaster" ? FontWeight.bold : FontWeight.normal,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         )