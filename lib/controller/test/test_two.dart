// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:pod_player/pod_player.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late Future<List<String>> _videoLinksFuture;

// Future<List<String>> fetchVideoLinks() async {
//   final response = await http.get(Uri.parse(
//         "http://192.168.1.7:3000/api/v1/training/663e73c481819a451a0cd34e"));
//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body);
//     return data.cast<String>().toList();
//   } else {
//     throw Exception('Failed to load video links');
//   }
// }
//   @override
//   void initState() {
//     super.initState();
//     _videoLinksFuture = fetchVideoLinks();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: FutureBuilder<List<String>>(
//         future: _videoLinksFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final videoLinks = snapshot.data;
//             return ListView.builder(
//               itemCount: videoLinks?.length ?? 0,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PodPlayer(
//                           dataSource: PodPlayerDataSource.network(videoLinks[index]),
//                           autoPlay: true,
//                         ),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     child: ListTile(
//                       title: Text('Video ${index + 1}'),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }