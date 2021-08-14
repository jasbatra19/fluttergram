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
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
              color: Colors.indigo.shade300,
              height: size.height,
              width: size.width,
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.purple,
                        ),
                        hintStyle: TextStyle(color: Colors.black),
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
                          color: Colors.purple,
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "Enter Password",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(40),
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.purple,
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
