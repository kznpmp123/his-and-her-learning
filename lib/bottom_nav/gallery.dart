import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Gallery extends StatefulWidget {

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            title: Center(
              child: Text("His's and Her's Gallery", style: TextStyle(fontSize: 16.0,
                  color: Colors.black
              )),
            ),
        ),
        body: const WebView(
          initialUrl: 'https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com/hiss-and-hers-gallery',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

// class Album extends StatefulWidget {
//   @override
//   _AlbumState createState() => _AlbumState();
// }
// class _AlbumState extends State<Album> {
//   @override
//   Widget build(BuildContext context) => DefaultTabController(
//     length: 6,
//     child: Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text(
//           "His's and Her's Album",
//           style: TextStyle(color: Colors.black, fontSize: 16, letterSpacing: 1),
//         )
//         ),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.white, Colors.white],
//               begin: Alignment.bottomRight,
//               end: Alignment.topLeft,
//             ),
//           ),
//         ),
//         bottom: TabBar(
//           //isScrollable: true,
//           indicatorColor: Colors.black,
//           labelColor: Colors.black,
//           labelStyle: TextStyle(fontSize: 9),
//           indicatorWeight: 5,
//           tabs: [
//             Tab(icon: Icon(Icons.person, color: Colors.black), text: 'L - 1'),
//             Tab(icon: Icon(Icons.group, color: Colors.black), text: 'L - 2'),
//             Tab(icon: Icon(Icons.local_florist, color: Colors.black), text: 'Garment'),
//             Tab(icon: Icon(Icons.emoji_people, color: Colors.black), text: 'Men'),
//             Tab(icon: Icon(Icons.face, color: Colors.black), text: 'Teacher'),
//             Tab(icon: Icon(Icons.filter_vintage, color: Colors.black), text: 'Activity'),
//           ],
//         ),
//         // elevation: 20,
//         titleSpacing: 20,
//       ),
//       body: TabBarView(
//         children: [
//           Level1(),
//           Level2(),
//           Garment(),
//           MenSwear(),
//           TrDrawing(),
//           Activity(),
//
//         ],
//       ),
//     ),
//   );
// }
//
// class Level1 extends StatefulWidget {
//   @override
//   _Level1State createState() => _Level1State();
// }
// class _Level1State extends State<Level1> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: const WebView(
//           initialUrl: 'https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com/level-1',
//           javascriptMode: JavascriptMode.unrestricted,
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class Level2 extends StatefulWidget {
//   @override
//   _Level2State createState() => _Level2State();
// }
// class _Level2State extends State<Level2> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: const WebView(
//           initialUrl: 'https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com/level-2',
//           javascriptMode: JavascriptMode.unrestricted,
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
// class Garment extends StatefulWidget {
//   @override
//   _GarmentState createState() => _GarmentState();
// }
// class _GarmentState extends State<Garment> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: const WebView(
//           initialUrl: 'https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com/garment',
//           javascriptMode: JavascriptMode.unrestricted,
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class MenSwear extends StatefulWidget {
//   @override
//   _MenSwearState createState() => _MenSwearState();
// }
// class _MenSwearState extends State<MenSwear> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: const WebView(
//           initialUrl: 'https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com/men-swear',
//           javascriptMode: JavascriptMode.unrestricted,
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class TrDrawing extends StatefulWidget {
//   @override
//   _TrDrawingState createState() => _TrDrawingState();
// }
// class _TrDrawingState extends State<TrDrawing> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: const WebView(
//           initialUrl: 'https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com/tr-drawing',
//           javascriptMode: JavascriptMode.unrestricted,
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class Activity extends StatefulWidget {
//   @override
//   _ActivityState createState() => _ActivityState();
// }
// class _ActivityState extends State<Activity> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: const WebView(
//           initialUrl: 'https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com/hiss-and-hers-gallery',
//           javascriptMode: JavascriptMode.unrestricted,
//         ),
//       ),
//     );
//   }
// }
