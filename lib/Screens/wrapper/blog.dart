import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttergram/Screens/Create.dart';
import 'package:fluttergram/Screens/viewBlog.dart';
class Blog extends StatefulWidget {
  const Blog({ Key? key }) : super(key: key);

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        leading:IconButton(onPressed:(){
          // profile page
        }, icon: Icon(Icons.person)),
        actions: [IconButton(onPressed: (){
          // camera
           Navigator.push(
              context, MaterialPageRoute(builder: (context) => Upload()));
        }, icon:Icon(Icons.add_a_photo_outlined))],
        backgroundColor: Colors.black38,
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
    );
  }
}


class BlogList extends StatefulWidget {
  const BlogList({ Key? key }) : super(key: key);

  @override
  State<BlogList> createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("blogs").snapshots(),
      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
        if(!snapshot.hasData){
          return Container(
            child: CircularProgressIndicator(),
          );
        }
        else{
          return ListView.builder(
          itemCount:snapshot.data!.docs.length ,
          itemBuilder:(BuildContext context,int index){
            return Container(
              child: GestureDetector(
                onTap: (){
 Navigator.push(
              context, MaterialPageRoute(builder: (context) => ViewBlog(title: snapshot.data!.docs[index]["title"],author: snapshot.data!.docs[index]["author"],desc: snapshot.data!.docs[index]["description"],url: snapshot.data!.docs[index]["imageUrl"],)));
                },
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          height: size.height * 0.6,
                          width: size.width,
                          child: Image.network("${snapshot.data!.docs[index]['imageUrl']}",
                            fit: BoxFit.fill,
                          ),
                          ),

                      Container(
                          margin: EdgeInsets.all(10),
                          height: size.height * 0.6,
                          width: size.width,
                          
                              ),
                              Container(
                                color: Color.fromARGB(255, 149, 215, 248),
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(onPressed: (){}, icon: Icon(Icons.person_pin,color:Colors.black,size:size.width*0.1,)),
                              ),
                      Container(
                        margin: EdgeInsets.all(10),
                     
                        height: size.height * 0.7,
                        width: size.width,
                       
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: size.width*0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(1)
                              ),
                              child: Center(
                                child: Text(
                                  "${snapshot.data!.docs[index]["title"]}".toString().toUpperCase(),
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(1)
                              ),
                              child: Text(
                                "${snapshot.data!.docs[index]["description"]}".toString().toLowerCase(),
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                style:
                                    TextStyle(fontSize: 25, fontFamily: "Courgette"),
                              ),
                            ),
                            Container(
                              // width: size.width*0.2,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(1)
                              ),
                              child: Text(
                                "${snapshot.data!.docs[index]["author"]}".toString().toUpperCase(),
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 20),
                              ),
                            ),
                    ],
                  ),
                  ),
                ],
                ),
                ),
              ),
            );
          } ,
          );
        }
      },
    );
  }
}

