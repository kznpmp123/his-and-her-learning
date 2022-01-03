import 'package:kzn/bottom_nav/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

String url ='https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com';

Future fetchWpPosts() async {
  final response = await http.get(Uri.parse(
    "https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com/index.php/wp-json/wp/v2/posts?per_page=100&categories=289&orderby=date&status=publish",
    // headers: {"Accept: application/json"}
  ));

  var covetedDatatoJson = jsonDecode(response.body);
  return covetedDatatoJson;
}


Future fetchWpPostImageUrl(String href ) async {

  final response = await http.get(Uri.parse(href), headers: {"Accept": "application/json"});
  var covetedDatatoJson = jsonDecode(response.body);
  print(covetedDatatoJson);
  return covetedDatatoJson;
}

class Noti extends StatefulWidget {
  // const Blog({Key? key}) : super(key: key);
  @override
  _NotiState createState() => _NotiState();
}
class _NotiState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.indigo),
        backgroundColor: Colors.white,
        title: Center(
          child: Text("His's and Her's New Classes", style: TextStyle(fontWeight: FontWeight.w700,
              fontSize: 16.0,
              color: Colors.black
          )),
        ),
      ),

      body: FutureBuilder(
        future: fetchWpPosts(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Map wppost = snapshot.data[index];

                // you write wp:featuredmedia:
                // I fixed wp:featuredmedia

                return PostTile(
                    href: wppost["_links"]["wp:featuredmedia"][0]["href"],
                    title: wppost["title"]["rendered"].replaceAll("#038;", ""),
                    desc: wppost["excerpt"]["rendered"],
                    content: wppost["content"]["rendered"]);
              },);
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}


class PostTile extends StatefulWidget {
  const PostTile({Key key, this.href, this.title, this.desc, this.content}) : super(key: key);

  final String href, title, desc, content;

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  var imageUrl = "";
  Widget shortDescritionView (){
    return Html(
      data: widget.desc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Post(
          desc: widget.content,
          imageUrl: imageUrl,
          title: widget.title,
        )));
      },
      child: Card(
        elevation: 5,
        // height: 150,
        margin: EdgeInsets.only(top: 8),
        // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: fetchWpPostImageUrl(widget.href),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.hasData){
                  imageUrl = snapshot.data["guid"]["rendered"];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(snapshot.data['guid']["rendered"],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover

                    ),
                  );
                }
                if(snapshot.hasError){
                  return Text(snapshot.error.toString());
                }

                return Center(child: CircularProgressIndicator());
              },
            ),

            SizedBox(width: 8),

            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(widget.title,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)
              ),
                shortDescritionView(),
              ],)),
            SizedBox(width: 5),

          ],
        ),
      ),
    );
  }
}


