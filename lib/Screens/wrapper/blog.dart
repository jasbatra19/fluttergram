import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttergram/Screens/Create.dart';
// import 'package:fluttergram/services/data.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  // crudMethods CrudMethods = new crudMethods();
  // QuerySnapshot? blogSnapshot;
  // @override
  // void initState() {
  //   super.initState();
  //   CrudMethods.getData().then((result) {
  //     blogSnapshot = result;
  //   });
  // }
  // final FirebaseFirestore fb = FirebaseFirestore.instance;

  Widget BlogList() {
    var size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('blogs').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((document) {
            return Container(
                child: Container(
              child: Stack(children: [
                Container(
                    margin: EdgeInsets.all(10),
                    height: size.height * 0.3,
                    width: size.width,
                    child: Image.network(
                      document["imageUrl"],
                      fit: BoxFit.cover,
                    )),
                Container(
                    margin: EdgeInsets.all(10),
                    height: size.height * 0.3,
                    width: size.width,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.4))),
                Container(
                  margin: EdgeInsets.all(10),
                  height: size.height * 0.3,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        document["title"],
                        style: TextStyle(fontSize: 30, fontFamily: "Courgette"),
                      ),
                      Text(
                        document["description"],
                        style: TextStyle(fontSize: 25, fontFamily: "Courgette"),
                      ),
                      Text(
                        document["author"],
                        style: TextStyle(fontSize: 20, fontFamily: "Courgette"),
                      )
                    ],
                  ),
                ),
                // child: BlogTile(
                //   author: document['author'],
                //   image: document['imageUrl'],
                //   desc: document['description'],
                //   title: document['title'],
              ] // ),
                  ),
            ));
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter"),
            Text(
              "gram",
              style: TextStyle(color: Colors.purple.shade500),
            )
          ],
        ),
      ),
      body: BlogList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo_outlined),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateBlog()));
        },
      ),
    );
  }
}

// class BlogTile extends StatelessWidget {
//   BlogTile(
//       {@required this.image,
//       @required this.author,
//       @required this.desc,
//       @required this.title});
//   String? image, title, desc, author;
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     return Container(
//       child: Stack(
//         children: [
//           Image.network(image),
//           Container(
//               height: size.height,
//               width: size.width,
//               decoration: BoxDecoration(color: Colors.black.withOpacity(0.3))),
//           Container(
//             child: Column(
//               children: [Text(title!), Text(desc!), Text(author!)],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
