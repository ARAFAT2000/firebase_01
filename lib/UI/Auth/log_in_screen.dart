import 'package:firebase_01/UI/Auth/signup_screen.dart';
import 'package:firebase_01/Utils/utils.dart';
import 'package:firebase_01/Widget/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../Real_timeDatabase_Post_screen/post_screen.dart';
import 'log_in_with_phone.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool loading =false;
  TextEditingController passwordController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  final _formKey=GlobalKey<FormState>();
  FirebaseAuth _auth= FirebaseAuth.instance;
  void login(){
    setState(() {
      loading=true;
    });
       _auth.signInWithEmailAndPassword(
           email: emailController.text,
           password: passwordController.text.toString()).then((value) {
             Utils().toastmessege(value.user!.email.toString());
             Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen()));
             setState(() {
               loading=false;
             });
       }).
          onError((error, stackTrace) {
            debugPrint(error.toString());
            Utils().toastmessege(error.toString());
            setState(() {
              loading=false;
            });
       });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Log In Screen'),
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
                title: 'Log In',
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    login();
                  }
              },),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text("Don't have an account "),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                  }, child:Text('Sign Up'))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>LogInWithPhone()));
                },
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.deepPurple
                    )
                  ),
                  child: Center(
                    child: Text('Log In With Phone'),
                  ),
                ),
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
