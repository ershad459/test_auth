import 'package:flutter/material.dart';
import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Google Login"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
            left: 20, right: 20, top: size.height * 0.2, bottom: size.height * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Hello, \nGoogle sign in",
                style: TextStyle(
                    fontSize: 30
                )),
            // GestureDetector(
            //     onTap: () {
            //       AuthService().signInWithGoogle();
            //     },
            //     child: const Image(width: 100, image: AssetImage('assets/google.png'))),
            MaterialButton(onPressed: (){
              AuthService().signInWithGoogle();
            },
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)
              ),
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
              minWidth: double.infinity,
              child: Text("sign in with google",style: TextStyle(
                  color: Colors.white
              ),),)

          ],
        ),
      ),
    );
  }
}