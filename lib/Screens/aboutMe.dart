import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:fluttergram/Screens/wrapper/wrapper.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.indigoAccent.shade400,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "About Me",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "Blog"),
          ],
          onTap: (index) {
            setState(() {
              if (index == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Wrapper()));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutMe()));
              }
            });
          },
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("About Me | Flutter"),
              Text(
                "gram",
                style: TextStyle(color: Colors.purple.shade500),
              )
            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.3,
                width: size.width,
                color: Colors.amber,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.black),
                      color: Colors.deepPurple,
                      image: DecorationImage(
                          image: AssetImage("images/myPic.jpg"),
                          fit: BoxFit.cover)),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                ),
              ),
              Container(
                height: size.height * 0.1,
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  color: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Jasmine Batra |Developer",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Courgette",
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.indigo.shade100,
                padding: EdgeInsets.all(20),
                child: Text(
                  "Hey There! Welcome to Fluttergram.\nI am Jasmine Batra,currently pursuing Computer Science from Thapar Institute Of Engineering and Technology.\nI have gained knowlegde of C,C++,App Development,Web Development during my 1st yr of B.E. and had a prior knowlegde of Java and MySQL.\n",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white, border: Border.all(width: 2)),
                padding: EdgeInsets.all(20),
                child: Text(
                  "Contact for project ideas/collab:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "courgette",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  color: Colors.indigo.shade100,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email_rounded,
                            color: Colors.purple,
                          ),
                          Text(
                            " jasbatra01@gmail.com",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )
                        ],
                      ),
                      Text("\n"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final url =
                                  'https://www.linkedin.com/in/jasmine-batra-a11ba41bb/';
                              await launch(url);
                            },
                            child: CircleAvatar(
                              child: Image.asset("images/link.jpeg"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final url =
                                  "https://www.instagram.com/jasbatra01/";
                              await launch(url);
                            },
                            child: CircleAvatar(
                              child: Image.asset(
                                "images/insta.jpeg",
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final url = "https://github.com/jasbatra19";
                              await launch(url);
                            },
                            child: CircleAvatar(
                              child: Image.asset("images/github.jpeg"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
