// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_audio_query/flutter_audio_query.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Music(),
//     );
//   }
// }

// class Music extends StatefulWidget {
//   @override
//   _MusicState createState() => _MusicState();
// }

// class _MusicState extends State<Music> {
//   MediaQueryData media;
//   List<SongInfo> songs;
//   AudioPlayer audioPlayer;
//   bool isplay = false;
//   int idx;

//   @override
//   void initState() {
//     super.initState();
//     getsongs();
//     audioPlayer = AudioPlayer();
//     AudioPlayer.logEnabled = true;
//   }

//   void getsongs() async {
//     final FlutterAudioQuery audioQuery = new FlutterAudioQuery();
//     songs = await audioQuery.getSongs();
//     print("lenght: ${songs.length}");
//   }

//   void seekTo() async {
//     // int pp = 0;
//     // print("pp : $pp");
//     // var d = await audioPlayer.getDuration();
//     // print("object:$d");
//     audioPlayer.onAudioPositionChanged.listen((Duration p) => {
//           // print('Current position: $p');

//           print("object2 : $p")
//         });
//     // int dd = 4000 + d;
//     // await audioPlayer.seek(Duration(seconds: 40 + pp));
//   }

//   playLocal(url) async {
//     // await audioPlayer.setFilePath(url);
//     await audioPlayer.play(url, isLocal: true);
//     // await audioPlayer.play();

//     // AudioManager.instance.play()

//     // AudioManager.instance.start(
//     //   file,
//     //   " title",
//     //   desc: "desc",
//     //   cover: "",
//     // );

//     // AudioManager.instance.playOrPause();

//     // print("risult: $result");
//   }

//   // @override
//   // void dispose() {
//   //   super.dispose();
//   //   audioPlayer.dispose();
//   //   // audioPlayer.release();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     media = MediaQuery.of(context);
//     //

//     return Container(
//       height: media.size.height,
//       width: media.size.width,
//       color: Colors.blueGrey[900],
//       child: ListView.builder(
//         itemCount: songs.length,
//         itemBuilder: (context, index) {
//           return Card(
//             color: idx == index ? Colors.blueGrey[600] : Colors.white,
//             child: ListTile(
//               // tileColor: isplay ? Colors.blueGrey[700] : Colors.white24,
//               leading: idx == index
//                   ? Icon(
//                       Icons.headphones,
//                       color: Colors.deepOrange,
//                     )
//                   : Icon(Icons.headphones),
//               title: Text(songs[index].title),
//               onTap: () {
//                 if (!isplay || idx != index) {
//                   playLocal(songs[index].uri);
//                   setState(() {});
//                   idx = index;
//                   isplay = true;
//                 } else {
//                   audioPlayer.pause();
//                   isplay = false;
//                 }
//               },
//               trailing: IconButton(
//                   icon: Icon(Icons.arrow_right_alt), onPressed: seekTo),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }






// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(home: Painter());
// //   }
// // }

// // class Painter extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: CustomPaint(
// //         painter: LinePainter(),
// //         child: Container(),
// //       ),
// //     );
// //   }
// // }

// // class LinePainter extends CustomPainter {
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     // TODO: implement paint
// //     var paint = Paint()
// //       ..color = Colors.red
// //       ..strokeWidth = 7.0
// //       ..strokeCap = StrokeCap.square;

// //     Offset startingPoint = Offset(0, 0);
// //     Offset endingPoint = Offset(size.width, size.height);

// //     canvas.drawLine(startingPoint, endingPoint, paint);
// //   }

// //   @override
// //   bool shouldRepaint(covariant CustomPainter oldDelegate) {
// //     // TODO: implement shouldRepaint
// //     return false;
// //   }
// // }


// // class Sheet extends StatelessWidget {

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(

// //     );
// //   }
// // }

// // class ModalBottomSheet extends StatefulWidget {
// //   @override
// //   _ModalBottomSheetState createState() => _ModalBottomSheetState();
// // }

// // class _ModalBottomSheetState extends State<ModalBottomSheet> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           'Modal Bottom Sheet',
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: Container(
// //         alignment: Alignment.center,
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               "MODAL BOTTOM SHEET EXAMPLE",
// //               style: TextStyle(
// //                   fontStyle: FontStyle.italic,
// //                   letterSpacing: 0.4,
// //                   fontWeight: FontWeight.w600),
// //             ),
// //             SizedBox(
// //               height: 20,
// //             ),
// //             RaisedButton(
// //               shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.all(Radius.circular(10.0))),
// //               onPressed: () {
// //                 showModalBottomSheet(
// //                     context: context,
// //                     builder: (context) {
// //                       return Column(
// //                         mainAxisSize: MainAxisSize.min,
// //                         children: <Widget>[
// //                           ListTile(
// //                             leading: new Icon(Icons.photo),
// //                             title: new Text('Photo'),
// //                             onTap: () {
// //                               Navigator.pop(context);
// //                             },
// //                           ),
// //                           ListTile(
// //                             leading: new Icon(Icons.music_note),
// //                             title: new Text('Music'),
// //                             onTap: () {
// //                               Navigator.pop(context);
// //                             },
// //                           ),
// //                           ListTile(
// //                             leading: new Icon(Icons.videocam),
// //                             title: new Text('Video'),
// //                             onTap: () {
// //                               Navigator.pop(context);
// //                             },
// //                           ),
// //                           ListTile(
// //                             leading: new Icon(Icons.share),
// //                             title: new Text('Share'),
// //                             onTap: () {
// //                               Navigator.pop(context);
// //                             },
// //                           ),
// //                         ],
// //                       );
// //                     });
// //               },
// //               padding:
// //                   EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
// //               color: Colors.pink,
// //               child: Text(
// //                 'Click Me',
// //                 style: TextStyle(
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.w600,
// //                     letterSpacing: 0.6),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: FavoriteList(),
// //     );
// //   }
// // }

// // class FavoriteList extends StatelessWidget {
// //   MediaQueryData media;

// //   @override
// //   Widget build(BuildContext context) {
// //     media = MediaQuery.of(context);
// //     return SafeArea(
// //       child: Scaffold(
// //         body: Container(
// //           height: media.size.height,
// //           width: media.size.width,
// //           decoration: BoxDecoration(
// //               gradient: LinearGradient(
// //                   begin: Alignment.bottomRight,
// //                   end: Alignment.topCenter,
// //                   colors: [Colors.blueGrey[500], Colors.black])),
// //           child: Column(
// //             children: [
// //               Container(
// //                 height: media.size.height * .14,
// //                 width: media.size.width,
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Container(
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(15.0),
// //                         child: Column(
// //                           children: [
// //                             Text(
// //                               "Favorite",
// //                               style: TextStyle(
// //                                   color: Colors.white,
// //                                   fontSize: 25,
// //                                   fontWeight: FontWeight.normal),
// //                             ),
// //                             Text(
// //                               "26 Tracks",
// //                               style: TextStyle(color: Colors.white24),
// //                             )
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                     Padding(
// //                       padding: const EdgeInsets.all(9.0),
// //                       child: Container(
// //                         decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(10),
// //                             color: Colors.transparent,
// //                             boxShadow: [
// //                               BoxShadow(
// //                                   blurRadius: 5.0,
// //                                   color: Colors.transparent,
// //                                   spreadRadius: 1.1,
// //                                   offset: Offset(5, 1))
// //                             ]),
// //                         child: Icon(
// //                           Icons.favorite,
// //                           color: Colors.red,
// //                           size: 70,
// //                         ),
// //                       ),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //               Container(
// //                   height: 2,
// //                   width: media.size.width * .95,
// //                   color: Colors.blueGrey[800]),
// //               Container(
// //                 height: media.size.height * .70,
// //                 width: media.size.width,
// //                 color: Colors.transparent,
// //               ),
// //               Container(
// //                 height: media.size.height * .12,
// //                 width: media.size.width * .97,
// //                 // color: Colors.blueGrey[900],
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(12),
// //                   color: Colors.blueGrey[900],
// //                 ),
// //                 child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                     children: [
// //                       Container(
// //                         child: Icon(
// //                           Icons.music_note,
// //                           size: 40,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                       Text(
// //                         "music_song.mp3",
// //                         style: TextStyle(color: Colors.white24, fontSize: 25),
// //                       ),
// //                       // Icon(
// //                       //   Icons.play_arrow,
// //                       //   size: 45,
// //                       //   color: Colors.deepPurple,
// //                       // ),
// //                       IconButton(
// //                           onPressed: () {
// //                             showModalBottomSheet(
// //                                 context: context,
// //                                 builder: (context) {
// //                                   return Column(
// //                                     mainAxisSize: MainAxisSize.min,
// //                                     children: <Widget>[
// //                                       ListTile(
// //                                         leading: new Icon(Icons.photo),
// //                                         title: new Text('Photo'),
// //                                         onTap: () {
// //                                           Navigator.pop(context);
// //                                         },
// //                                       ),
// //                                       ListTile(
// //                                         leading: new Icon(Icons.music_note),
// //                                         title: new Text('Music'),
// //                                         onTap: () {
// //                                           Navigator.pop(context);
// //                                         },
// //                                       ),
// //                                       ListTile(
// //                                         leading: new Icon(Icons.videocam),
// //                                         title: new Text('Video'),
// //                                         onTap: () {
// //                                           Navigator.pop(context);
// //                                         },
// //                                       ),
// //                                       ListTile(
// //                                         leading: new Icon(Icons.share),
// //                                         title: new Text('Share'),
// //                                         onTap: () {
// //                                           Navigator.pop(context);
// //                                         },
// //                                       ),
// //                                     ],
// //                                   );
// //                                 });
// //                           },
// //                           icon: Icon(
// //                             Icons.play_arrow,
// //                             size: 45,
// //                             color: Colors.deepPurple,
// //                           ))
// //                     ]),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }



// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) => MaterialApp(
// // //         title: 'MediaQuery Demo',
// // //         theme: ThemeData(
// // //           primarySwatch: Colors.blue,
// // //           visualDensity: VisualDensity.adaptivePlatformDensity,
// // //         ),
// // //         home: _MediaQueryWidget(),
// // //       );
// // // }

// // // class _MediaQueryWidget extends StatefulWidget {
// // //   @override
// // //   State createState() => _MediaQueryWidgetState();
// // // }

// // // class _MediaQueryWidgetState extends State<_MediaQueryWidget> {
// // //   MediaQueryData media;
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     assert(debugCheckHasMediaQuery(context));
// // //     media = MediaQuery.of(context);
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         centerTitle: true,
// // //         title: const Text(
// // //           'MediaQuery Widget',
// // //           style: TextStyle(
// // //             fontSize: 20.0,
// // //             fontWeight: FontWeight.bold,
// // //           ),
// // //         ),
// // //       ),
// // //       body: Container(
// // //         child: Text(media.size.toString()),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // var size = MediaQuery.of(context).size;
// // //     // print(size);
// // //     return MediaQuery(
// // //       data: MediaQueryData(),
// // //       child: MaterialApp(
// // //         debugShowCheckedModeBanner: false,
// // //         // title: "Music",
// // //         home: SafeArea(
// // //           child: Scaffold(
// // //             appBar: AppBar(
// // //               title: Text("Playlists"),
// // //               backgroundColor: Colors.blueGrey[900],
// // //               elevation: 1,
// // //               centerTitle: true,
// // //             ),
// // //             body: Column(
// // //               children: [
// // //                 Container(
// // //                     height: 500,
// // //                     width: 400,
// // //                     alignment: Alignment.topCenter,
// // //                     decoration: BoxDecoration(

// // //                         // color: Colors.blueGrey[999],
// // //                         gradient: LinearGradient(
// // //                             begin: Alignment.bottomRight,
// // //                             end: Alignment.topLeft,
// // //                             colors: [
// // //                           Colors.blueGrey[900],
// // //                           Colors.lightBlue[900]
// // //                         ])),
// // //                     child: Column(
// // //                       mainAxisAlignment: MainAxisAlignment.start,
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       children: [
// // //                         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                             // crossAxisAlignment: CrossAxisAlignment.center,
// // //                             children: [
// // //                               Container(
// // //                                 margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
// // //                                 width: 130,
// // //                                 height: 130,
// // //                                 // color: Colors.white,
// // //                                 decoration: BoxDecoration(
// // //                                     color: Colors.black38,
// // //                                     borderRadius:
// // //                                         BorderRadius.all(Radius.circular(12))),
// // //                                 child: Column(
// // //                                   mainAxisAlignment: MainAxisAlignment.center,
// // //                                   children: [
// // //                                     Icon(
// // //                                       Icons.favorite,
// // //                                       size: 70,
// // //                                       color: Colors.red[900],
// // //                                     ),
// // //                                     Text(
// // //                                       "Favorites",
// // //                                       style: TextStyle(color: Colors.white),
// // //                                     )
// // //                                   ],
// // //                                 ),
// // //                               ),
// // //                               Container(
// // //                                 margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
// // //                                 width: 130,
// // //                                 height: 130,
// // //                                 // color: Colors.white,
// // //                                 decoration: BoxDecoration(
// // //                                     color: Colors.black38,
// // //                                     borderRadius:
// // //                                         BorderRadius.all(Radius.circular(12))),
// // //                                 child: Column(
// // //                                   mainAxisAlignment: MainAxisAlignment.center,
// // //                                   children: [
// // //                                     Icon(
// // //                                       Icons.music_note,
// // //                                       color: Colors.deepPurple,
// // //                                       size: 70,
// // //                                     ),
// // //                                     Text(
// // //                                       "All Songs",
// // //                                       style: TextStyle(color: Colors.white),
// // //                                     )
// // //                                   ],
// // //                                 ),
// // //                               )
// // //                             ]),
// // //                         SizedBox(
// // //                           height: 10,
// // //                         ),
// // //                         Padding(
// // //                           padding: const EdgeInsets.all(8.0),
// // //                           child: Text(
// // //                             "My PlayLists",
// // //                             style: TextStyle(
// // //                                 color: Colors.white,
// // //                                 fontSize: 20,
// // //                                 fontWeight: FontWeight.w400),
// // //                           ),
// // //                         ),
// // //                         Container(
// // //                           height: 2,
// // //                           width: MediaQuery.of(context).size.width,
// // //                           color: Colors.red,
// // //                         )
// // //                       ],
// // //                     )),
// // //                 // Container(
// // //                 //   height: 2,
// // //                 //   width: MediaQuery.of(context).size.width,
// // //                 //   color: Colors.red,
// // //                 // )

// // //                 // Container(
// // //                 //   width: 360,
// // //                 //   height: 320,
// // //                 //   // color: Colors.blueGrey[600],
// // //                 //   decoration: BoxDecoration(
// // //                 //       // color: Colors.blueGrey[700],
// // //                 //       gradient: LinearGradient(
// // //                 //           begin: Alignment.bottomRight,
// // //                 //           end: Alignment.topLeft,
// // //                 //           colors: [Colors.blueGrey[700], Colors.lightBlue[900]])),
// // //                 // )
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }



// // // // class MyApp extends StatefulWidget {
// // // //   @override
// // // //   _MyAppState createState() => _MyAppState();
// // // // }

// // // // class _MyAppState extends State<MyApp> {
// // // //   double val = 2.4;
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       home: Scaffold(
// // // //         appBar: AppBar(
// // // //           backgroundColor: Colors.black26,
// // // //           title: Text("MusicPlay"),
// // // //         ),
// // // //         backgroundColor: Colors.blueGrey[900],
// // // //         body: Column(
// // // //           children: [
// // // //             Container(
// // // //               margin: EdgeInsets.fromLTRB(60, 40, 60, 0),
// // // //               alignment: Alignment.center,
// // // //               // padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
// // // //               child: Text("Music App"),
// // // //               height: 230,
// // // //               width: 250,
// // // //               decoration: BoxDecoration(
// // // //                   color: Colors.blueGrey[200],
// // // //                   borderRadius: BorderRadius.circular(20)),
// // // //             ),
// // // //             SizedBox(
// // // //               height: 10,
// // // //             ),
// // // //             Text("music_song.mp3",
// // // //                 style: TextStyle(
// // // //                   color: Colors.white,
// // // //                   fontSize: 20,
// // // //                 )),
// // // //             Text(
// // // //               "sk-singer",
// // // //               style: TextStyle(fontSize: 17, color: Colors.white54),
// // // //             ),
// // // //             Slider(
// // // //               value: val,
// // // //               min: 0,
// // // //               max: 50,
// // // //               onChanged: (double value) {
// // // //                 setState(() {
// // // //                   val = value;
// // // //                 });
// // // //               },
// // // //               activeColor: Colors.white,
// // // //               inactiveColor: Colors.black,
// // // //               autofocus: false,
// // // //             ),
// // // //             Container(
// // // //               padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
// // // //               child: Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                 children: [Text("1.20"), Text("4.34")],
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
