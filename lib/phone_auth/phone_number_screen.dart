import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class phoneNumberScreen extends StatefulWidget {
  const phoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<phoneNumberScreen> createState() => _phoneNumberScreenState();
}

class _phoneNumberScreenState extends State<phoneNumberScreen> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpCodeController = TextEditingController();

 FirebaseAuth auth = FirebaseAuth.instance;

 String verificationIDReceived = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('phone number'),
      ),
   body: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       TextField(
         controller: phoneController,
       ),
       SizedBox(height: 10,),
       TextField(
         controller: otpCodeController,
       ),
       SizedBox(height: 10,),
       ElevatedButton(onPressed: (){

         verifyNumber();
       }, child: Text('login'))



     ],


   )

    );
  }


  void verifyNumber(){
    
    auth.verifyPhoneNumber(phoneNumber: '+989362100706',verificationCompleted: (PhoneAuthCredential credential)async{
      await auth.signInWithCredential(credential).then((value){
        print('logged in successfully');
      });
    },
        verificationFailed: (FirebaseAuthException exception){
        print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken){

        verificationIDReceived = verificationID;
        setState(() {

        });

        },
        codeAutoRetrievalTimeout: (String verificationID){

        });

  }
}
