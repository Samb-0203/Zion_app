// // body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Padding(
// //             padding:
// //                 const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 IconButton(
// //                   onPressed: () {},
// //                   icon: const Icon(
// //                     Icons.arrow_back,
// //                     color: Colors.white70,
// //                     size: 30,
// //                   ),
// //                 ),
// //                 Text(
// //                   'Song No : 022',
// //                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.white,
// //                       ),
// //                 ),
// //                 IconButton(
// //                   onPressed: () {},
// //                   icon: const Icon(
// //                     Icons.arrow_forward,
// //                     color: Colors.white70,
// //                     size: 30,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(height: 10), // Added space between elements
// //           Expanded(
// //             child: Container(
// //               width: deviceWidth,
// //               padding: const EdgeInsets.all(16.0),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //               child: const Center(
// //                 child: Text(
// //                   'Song Lyrics',
// //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
//   body: InkWell(
//         onTap: () {},
//         borderRadius: BorderRadius.circular(20),
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.white, width: 1),
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.black
//                 .withOpacity(0.1), // Slight background color for visibility
//           ),
//           child: const Row(
//             mainAxisSize:
//                 MainAxisSize.min, // Makes the row size adapt to content
//             children: [
//               SizedBox(
//                 width: 24,
//                 height: 24,
//                 child: Icon(Icons.music_note, color: Colors.white),
//               ),
//               Text('001', style: TextStyle(color: Colors.white)),
//               Spacer(),
//               Text('అడవి వృక్షములో జల్దరు వృక్షమెట్లున్నదో - కరుణా వృక్షములే',
//                   style: TextStyle(color: Colors.white)),
//               Spacer(),
//               Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
//             ],
//           ),
//         ),
//       ),
    