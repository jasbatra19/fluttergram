import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 226, 243),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 20, 0,0),
                    child: Text("FlutterGram",style: TextStyle(fontSize: 45,foreground: Paint()..shader=LinearGradient( colors: <Color>[
                    Colors.purple.shade100, 
                    Colors.purple.shade400,
                    Colors.deepPurple.shade400
                    //add more color here.
                ],
              ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0)),fontFamily: 'Courgette',fontStyle: FontStyle.normal,),textAlign:TextAlign.center,),
                  ),
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromRGBO(101, 35, 113, 1),
                        ),
                        hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        hintText: "Enter Email",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color.fromRGBO(101, 35, 113, 1),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "Enter Password",
                      ),
                    ),
                  ),
                   GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                      alignment: Alignment.center,
                      color: Color.fromARGB(255, 222, 196, 244),
                      
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize:20,color: Colors.black),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                      alignment: Alignment.center,
                       color: Color.fromARGB(255, 222, 196, 244),
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize:20,color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(40),
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.purple,
                        backgroundImage:AssetImage("images/google.png"),
                      ),
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
