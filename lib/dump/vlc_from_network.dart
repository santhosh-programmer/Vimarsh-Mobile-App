
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final VlcPlayerController _vlc = VlcPlayerController.network(
//     // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
//     // 'rtsp://b03773d78e34.entrypoint.cloud.wowza.com:1935/app-4065XT4Z/80c76e59_stream1',
//     'rtsp://b03773d78e34.entrypoint.cloud.wowza.com:1935/app-4065XT4Z/80c76e59_stream1',

//     hwAcc: HwAcc.full,
//     autoPlay: true,
//     options: VlcPlayerOptions(

//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(16, 21, 32, 1),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 30),
//               child: Material(
//                 borderRadius: BorderRadius.circular(10),
//                 clipBehavior: Clip.hardEdge,
//                 child: VlcPlayer(
//                   controller: _vlc,
//                   aspectRatio: 16 / 9,
//                   placeholder: const Center(child: CircularProgressIndicator()),
//                 ),
//               ),
//             ),
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
//     );
//   }
// }