import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paymentgateway/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Register.dart';
import 'common/common.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth=FirebaseAuth.instance;
  final gm=TextEditingController();
  final pass=TextEditingController();
  bool _isObscure = true;
  Future<void>logindata()async {
    final SharedPreferences sha =  await SharedPreferences.getInstance();
    sha.setString(userid, gm.text);

    try{
      _auth.signInWithEmailAndPassword(email: gm.text, password: pass.text).then((value){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>home()));
        Fluttertoast.showToast(msg: "Successfully Loged In");
      }).onError((FirebaseAuthException e, stackTrace){
        Fluttertoast.showToast(msg: e.message.toString());
      });
    }on FirebaseAuthException catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: () {
        if(Platform.isIOS){
          exit(0);
        }else{
          SystemNavigator.pop();
        }
        return Future.value(false);
      },
      child: Scaffold(
        body: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.3,),
              Text("LOGIN PAGE",style: TextStyle(color: Colors.black,fontSize: 35),),

              SizedBox(height: MediaQuery.of(context).size.height*0.05,),

              //EMAIL & TEXTFORMFIELD
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                    child: Text("Gmail",style: TextStyle( fontSize: 22,
                        color: Color(0xff000000)),)),
              ),
              SizedBox(height: 5,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,

                  child: TextFormField(
                    controller: gm,


                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xff929090)
                        )
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color(0xff929090)
                          )
                      ),
                      prefixIcon:Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.email)
                      ),
                      
                      hintText: "Enter Your Gmail",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color(0xff929090)
                          )
                      )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),

              //PASSWORD
              Center(
                child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: Text("Password",style: TextStyle( fontSize: 22,
                        color: Color(0xff000000)))),
              ),
              SizedBox(height: 5,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: TextFormField(
                    controller: pass,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color(0xff929090)
                            )
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color(0xff929090)
                            )
                        ),
                        prefixIcon:Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.password)
                        ),
                        hintText: "Enter Your Password",
                      suffixIcon:Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          icon: Icon(
                            _isObscure ? Icons.visibility_off : Icons.visibility,
                            size: 28,
                            color: Color(0xff000000),
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color(0xff929090)
                            )
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),

              //LOGIN BUTTON
              InkWell(
                onTap: () async {


                  logindata();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black,
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.5,
                  child:Text("LOGIN",style: TextStyle( fontSize: 18,
                      color: Colors.white)
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),

              //REGISTER TXT
              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Don’t Have an Account? ",style: TextStyle( fontSize: 15,
                            color: Color(0xff000000)),),
                        InkWell(
                          onTap: ()  {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                          },
                          child: Text("Register",style: TextStyle( fontSize: 15,
                              color: Color(0xff000000))),
                        ),
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
