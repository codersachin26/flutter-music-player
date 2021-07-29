import 'package:flutter/material.dart';
import 'package:music_player/pages/songsListScreen.dart';
import 'package:music_player/widgets/myDecoration.dart';
import 'package:music_player/widgets/playListsContainer.dart';
import 'package:music_player/widgets/songListCart.dart';

class PlayListsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .80,
      width: size.width,
      decoration: myDecoration(),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SongListCard(
                  listName: "All Songs",
                  listIcon: Icons.music_note,
                  iconColor: Colors.deepPurple,
                ),
                SongListCard(
                  listIcon: Icons.favorite,
                  listName: "Favorites",
                  iconColor: Colors.red,
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          PlayListContainer()
        ],
      ),
    );
  }
}

// // song list card
// class SongListCard extends StatelessWidget {
//   final String listName;
//   final IconData listIcon;
//   final Color iconColor;

//   const SongListCard({Key key, this.listName, this.listIcon, this.iconColor})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * .15,
//       width: MediaQuery.of(context).size.width * .27,
//       decoration: BoxDecoration(
//         color: Colors.blueGrey[700],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             listIcon,
//             size: 40,
//             color: iconColor,
//           ),
//           Text(
//             "$listName",
//             style: TextStyle(fontSize: 15, color: Colors.white),
//           )
//         ],
//       ),
//     );
//   }
// }

// class PlayListHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("PlayList"),
//     );
//   }
// }

// class NewPlayListButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           createNewPlayList(context);
//         },
//         icon: Icon(Icons.add));
//   }

// void createNewPlayLists(BuildContext context) {
//   showModalBottomSheet(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
//       backgroundColor: Colors.white,
//       context: context,
//       isScrollControlled: true,
//       builder: (context) => Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 18),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                   child: Text(
//                     'Enter your address',
//                   ),
//                 ),
//                 SizedBox(
//                   height: 8.0,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).viewInsets.bottom),
//                   child: TextField(
//                     decoration: InputDecoration(hintText: 'adddrss'),
//                     autofocus: true,
//                     // controller: _newMediaLinkAddressController,
//                   ),
//                 ),
//                 // SizedBox(height: 10),
//                 Row(
//                   children: [
//                     TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           "cancel",
//                         )),
//                     TextButton(onPressed: () {}, child: Text("create")),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 )
//               ],
//             ),
//           ));
// }

//   void createNewPlayList(BuildContext context) {
//     String playlistname;

//     showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         builder: (context) {
//           return SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.only(
//                   bottom: MediaQuery.of(context).viewInsets.bottom),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Text("New Playlist"),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       hintText: "playlistname",
//                     ),
//                     onChanged: (value) {
//                       playlistname = value;
//                     },
//                     validator: (value) {
//                       if (value.isEmpty) {
//                         return "playlistname can't be empty";
//                       }
//                       return null;
//                     },
//                   ),
//                   Row(
//                     children: [
//                       TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: Text("cancel")),
//                       TextButton(
//                           onPressed: () {
//                             createPlayList(OpenDb.db, playlistname);
//                             Navigator.pop(context);
//                           },
//                           child: Text("create")),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }

// show play list name
// class MyPlayListName extends StatefulWidget {
//   @override
//   _MyPlayListNameState createState() => _MyPlayListNameState();
// }

// class _MyPlayListNameState extends State<MyPlayListName> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
// Expanded(
//   child: Container(
//     color: Colors.transparent,
//     child: OpenDb.playlists == null
//         ? Text("no play")
//         : ListView.builder(/ const PlayListContainer({ Key? key }) : super(key: key);
//             itemCount: OpenDb.playlists.length,
//             itemBuilder: (BuildContext context, idx) {
//               return PlayListView(
//                 listname: OpenDb.playlists[idx],
//               );
//             },
//           ),
//   ),
// ),
//       ],
//     );
//   }
// }

// // show all playlists
// class PlayListView extends StatelessWidget {
//   final Map<String, dynamic> listname;

//   const PlayListView({Key key, this.listname}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Image.asset(
//         "assests/music.jpg",
//       ),
//       title: Text(listname['name']),
//       subtitle: Text(listname['id'].toString()),
//     );
//   }
// }

// class PlayListContainer extends StatefulWidget {
//   @override
//   _PlayListContainerState createState() => _PlayListContainerState();
// }

// class _PlayListContainerState extends State<PlayListContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   child: Text("playlists"),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.add),
//                   onPressed: () {
//                     // String playlistname;
//                     showDialog(
//                         context: context,
//                         builder: (BuildContext context) =>
//                             newPlaylistDialogBox(context));
//                   },
//                 )
//               ],
//             ),
//             Expanded(
//               child: Container(
//                 color: Colors.transparent,
//                 child: OpenDb.playlists == null
//                     ? Text("no play")
//                     : ListView.builder(
//                         itemCount: OpenDb.playlists.length,
//                         itemBuilder: (BuildContext context, idx) {
//                           return PlayListView(
//                             listname: OpenDb.playlists[idx],
//                           );
//                         },
//                       ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// return bottom sheet
// void createNewPlayList(BuildContext context) {
//   String playlistname;

//   showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text("New Playlist"),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "playlistname",
//                   ),
//                   onChanged: (value) {
//                     playlistname = value;
//                   },
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return "playlistname can't be empty";
//                     }
//                     return null;
//                   },
//                 ),
//                 Row(
//                   children: [
//                     TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text("cancel")),
//                     TextButton(
//                         onPressed: () {
//                           createPlayList(OpenDb.db, playlistname);
//                           // setState(() {});
//                           Navigator.pop(context);
//                         },
//                         child: Text("create")),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       });
// }

// AlertDialog showDialogs(BuildContext context) {
//   return AlertDialog(
//     title: const Text('New PlayList'),
//     content: SingleChildScrollView(
//       child: ListBody(
//         children: <Widget>[TextFormField()],
//       ),
//     ),
//     actions: <Widget>[
//       TextButton(
//         child: const Text('Create'),
//         onPressed: () {
//           Navigator.of(context).pop(); // setState(() {});
//         },
//       ),
//     ],
//   );
// }

// myDiallog(BuildContext context) {
//   String playlistname;
//   return Dialog(
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0)), //this right here
//     child: Container(
//       height: 300.0,
//       width: 300.0,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.all(15.0),
//             child: TextFormField(
//               decoration: InputDecoration(hintText: "playlist"),
//               onChanged: (value) {
//                 playlistname = value;
//               },
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(15.0),
//             child: TextFormField(),
//           ),
//           Padding(padding: EdgeInsets.only(top: 50.0)),
//           TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 print("pop clicked");
//                 createPlayList(OpenDb.db, playlistname);
//                 updatePlayList();
//               },
//               child: Text(
//                 'Got It!',
//                 style: TextStyle(color: Colors.purple, fontSize: 18.0),
//               ))
//         ],
//       ),
//     ),
//   );
// }

// Dialog errorDialog = Dialog(
//   shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12.0)), //this right here
//   child: Container(
//     height: 300.0,
//     width: 300.0,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.all(15.0),
//           child: TextFormField(
//             decoration: InputDecoration(hintText: "playlist"),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(15.0),
//           child: TextFormField(),
//         ),
//         Padding(padding: EdgeInsets.only(top: 50.0)),
//         TextButton(
//             onPressed: () {
//               // Navigator.of(context).pop();
//             },
//             child: Text(
//               'Got It!',
//               style: TextStyle(color: Colors.purple, fontSize: 18.0),
//             ))
//       ],
//     ),
//   ),
// );




// GlobalKey<_MyTextWidgetState> textGlobalKey = new GlobalKey<_MyTextWidgetState>();