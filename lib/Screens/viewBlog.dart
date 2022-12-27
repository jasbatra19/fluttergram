import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewBlog extends StatefulWidget {

  String url;
  String desc;
  String author;
  String title;
   ViewBlog({ Key? key,required this.title,required this.desc,required this.author,required this.url}) : super(key: key);

  @override
  State<ViewBlog> createState() => _ViewBlogState();
}

class _ViewBlogState extends State<ViewBlog> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("blogs").snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
        return ListView(
         children: [
    
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network("${widget.url}",filterQuality: FilterQuality.high,fit: BoxFit.cover,),
          ),
           Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 174, 149, 216),
          ),
          margin: EdgeInsets.only(top:10),
          child: Container(
            alignment: Alignment.center,
            child: Text("${widget.title[0].toUpperCase()}${widget.title.substring(1).toLowerCase()}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,),))),
          Container(
            color: Colors.indigo.shade100,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top:10),
          child: Column(
            children: [
              Text("By:  ${widget.author[0].toUpperCase()}${widget.author.substring(1).toLowerCase()}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800,)),
              
            ],
          )),
        

            Container(
          padding: EdgeInsets.all(10),
          color: Colors.purple.shade100,
          margin: EdgeInsets.only(top:10),
          child: Column(
            children: [
              // Text("DESCRIPTION",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800,)),
              Container(
                
                child: Text(widget.desc,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),)),
            ],
          )),
        

         ],
        );
      }),
    );
  }
}