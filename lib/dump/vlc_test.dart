// import 'package:flutter/material.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';

// class StreamPage extends StatefulWidget {
//   const StreamPage({super.key});

//   @override
//   State<StreamPage> createState() => _StreamPageState();
// }

// class _StreamPageState extends State<StreamPage> {
//   final VlcPlayerController _videoPlayerController = VlcPlayerController.network(
//     'https://media.w3.org/2010/05/sintel/trailer.mp4',
//     hwAcc: HwAcc.auto,
//     autoPlay: false,
//     options: VlcPlayerOptions(),
//   );

//   Future<void> initializePlayer() async {}

//   @override
//   void dispose() async {
//     super.dispose();
//     await _videoPlayerController.stopRendererScanning();
//     await _videoPlayerController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Center(
//           child: VlcPlayer(
//             controller: _videoPlayerController,
//             aspectRatio: 16 / 9,
//             placeholder: const Center(
//               child: CircularProgressIndicator(),
//             ),
//           ),
//         ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';

// class StreamPage extends StatefulWidget {
//   const StreamPage({super.key});

//   @override
//   State<StreamPage> createState() => _StreamPageState();
// }

// class _StreamPageState extends State<StreamPage> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(
//       Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
//     )..initialize().then((_) async {
//         await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(16, 21, 32, 1),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _controller.value.isInitialized
//                 ? Container(
//                     width: 500,
//                     clipBehavior: Clip.hardEdge,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: AspectRatio(
//                       aspectRatio: 16.0 / 9.0,
//                       child: VideoPlayer(_controller),
//                     ),
//                   )
//                 : Container(),
//             SizedBox(
//               height: 120,
//               width: 120,
//               child: Stack(
//                 children: [
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                       ),
//                       child: const Icon(
//                         Icons.keyboard_arrow_up_rounded,
//                         size: 35,
//                       ),
//                     ),
//                   ),
//                   Align(
//                       alignment: Alignment.centerRight,
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                         ),
//                         child: const Icon(
//                           Icons.keyboard_arrow_right_rounded,
//                           size: 35,
//                         ),
//                       )),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                       ),
//                       child: const Icon(
//                         Icons.keyboard_arrow_down_rounded,
//                         size: 35,
//                       ),
//                     ),
//                   ),
//                   Align(
//                       alignment: Alignment.centerLeft,
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                         ),
//                         child: const Icon(
//                           Icons.keyboard_arrow_left_rounded,
//                           size: 35,
//                         ),
//                       )),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     setState(() {
//       //       _controller.value.isPlaying ? _controller.pause() : _controller.play();
//       //     });
//       //   },
//       //   child: Icon(
//       //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//       //   ),
//       // ),
//     );
//   }
// }
