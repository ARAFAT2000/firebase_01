import 'package:firebase_01/UI/Auth/log_in_screen.dart';
import 'package:firebase_01/Utils/utils.dart';
import 'package:firebase_01/Widget/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController passwordController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  final _formKey=GlobalKey<FormState>();
  bool loading=false;
  FirebaseAuth _auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign Up Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(

                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Email';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'email',
                        prefixIcon: Icon(Icons.alternate_email_rounded)
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Password';
                      }
                      return null;
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: 'password',
                        prefixIcon: Icon(Icons.lock_open)
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),

                ],
              ),
            ),
            SizedBox(height: 40,),
            RoundButton(
              loading: loading,
              title: 'Sign Up',
              onTap: (){
              if(_formKey.currentState!.validate()){
                setState(() {
                  loading=true;
                });
                _auth.createUserWithEmailAndPassword(
                    email:emailController.text.toString(),
                    password: passwordController.text.toString()).then((value) {
                  setState(() {
                    loading=false;
                  });
                }).
                onError((error, stackTrace) {
                  Utils().toastmessege(error.toString());
                  setState(() {
                    loading=false;
                  });
                });
              }
            },
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Text("Already have an account "),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
                }, child:Text('Log In'))
              ],
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
