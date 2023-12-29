import 'package:firebase_01/UI/Auth/verify_code.dart';
import 'package:firebase_01/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Widget/round_button.dart';

class LogInWithPhone extends StatefulWidget {
  const LogInWithPhone({super.key});

  @override
  State<LogInWithPhone> createState() => _LogInWithPhoneState();
}

class _LogInWithPhoneState extends State<LogInWithPhone> {
  final phoneController= TextEditingController();
  bool login=false;
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in With phone'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: phoneController,
               decoration: InputDecoration(
                 hintText: '+880 345 567 546'
               ),

            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(title: 'Send ',onTap: (){
              auth.verifyPhoneNumber(
                phoneNumber: phoneController.text,
                  verificationCompleted: (_){

                  },
                  verificationFailed: (e){
                  Utils().toastmessege(e.toString());
                  },
                  codeSent: (String varificationid, int? token){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyPhoneNumberScreen(
                      varificationid: varificationid,
                    )));
                  },
                  codeAutoRetrievalTimeout: (e){
                    Utils().toastmessege(e.toString());
                  });
            },)
          ],
        ),
      ),
    );
  }
}
