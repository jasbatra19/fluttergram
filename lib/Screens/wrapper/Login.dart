import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttergram/Screens/wrapper/blog.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn =GoogleSignIn();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _emailField = Container(
      child: TextFormField(
        controller: _email,
        validator: (value) {
          if (value!.isEmpty) {
            return "enter email";
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          _email.text = value!;
        },
         textInputAction: TextInputAction.next,
         keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Color.fromRGBO(101, 35, 113, 1),
          ),
          hintStyle: TextStyle(color: Colors.purple.shade100),
          hintText: "Enter Email",
        ),
      ),
    );

    final _passwordField = Container(
      margin: EdgeInsets.only(top: 30, bottom: 30),
      child: TextFormField(
        controller: _password,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          _password.text = value!;
        },
        textInputAction: TextInputAction.done,

      keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Color.fromRGBO(101, 35, 113, 1),
          ),
          hintStyle: TextStyle(color: Colors.purple.shade100),
          hintText: "Enter Password",
        ),
      ),
    );

    final _loginButton = GestureDetector(
      onTap: () {
        signInWithEmailPassword(_email.text, _password.text);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 20, left: 40, right: 40),
        alignment: Alignment.center,
        color: Color.fromARGB(255, 222, 196, 244),
        child: Text(
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.black,letterSpacing: 0.5),
        ),
      ),
    );

    final _registerButton = GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 20, left: 40, right: 40),
        alignment: Alignment.center,
        color: Color.fromARGB(255, 222, 196, 244),
        child: Text(
          "Register",
          style: TextStyle(fontSize: 20, color: Colors.black,letterSpacing: 0.5),
        ),
      ),
    );

    final _googleLoginButton = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(40),
      child: GestureDetector(
        onTap: () {
          signInwithGoogle();
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.purple,
          backgroundImage: AssetImage("images/google.png"),
        ),
      ),
    );

    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 25, 24, 25),
      body: SafeArea(
        child: Form(
          key: _formKey,
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
                    //app name
                    Container(
                      width: size.width,
                      height: size.height * 0.2,
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        "FlutterGram",
                        style: TextStyle(
                          fontSize: 45,
                          foreground: Paint()
                            ..shader = LinearGradient(
                              colors: <Color>[
                                Colors.purple.shade100,
                                Colors.purple.shade400,
                                Colors.deepPurple.shade400
                                //add more color here.
                              ],
                            ).createShader(
                                Rect.fromLTWH(0.0, 0.0, 200.0, 100.0)),
                          fontFamily: 'Courgette',
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    _emailField,
                    _passwordField,
                    _loginButton,
                    _registerButton,
                    _googleLoginButton
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
//normal sign in using email and password;

  void signInWithEmailPassword(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Blog())));
      } on FirebaseAuthException catch (error) {
        const snackbar = SnackBar(content: Text("error. user not found"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        print(error);
      }
    }
  }
  
// signin with google
  void signInwithGoogle()async{
    User? user;
    final GoogleSignIn googleUser= GoogleSignIn();
    final GoogleSignInAccount? googleacc = await googleUser.signIn();
    if(googleacc!=null){
      final GoogleSignInAuthentication googleauth=await googleacc.authentication;
      final AuthCredential authcredential=GoogleAuthProvider.credential(
        idToken: googleauth.idToken,
        accessToken: googleauth.accessToken
      );
      try{
      UserCredential result=await _auth.signInWithCredential(authcredential);
      user=result.user;
      } on FirebaseAuthException catch(e){
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
      }

      if(user!=null){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Blog()));
      }
    
    }

  }




