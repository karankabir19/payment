
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paymentgateway/LoginScreen.dart';
import 'common/common.dart';
import 'home.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}



class _RegisterState extends State<Register> {

  final _auth=FirebaseAuth.instance;
  final rgm=TextEditingController();
  final rpass=TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.3,),
            Text("REGISTER PAGE",style: TextStyle(color: Colors.black,fontSize: 35),),

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
                  controller: rgm,

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
                  controller: rpass,
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

            //REGISTER BUTTON
            InkWell(
              onTap: () async {

                {  try {
                  _auth.createUserWithEmailAndPassword(
                      email: rgm.text, password: rpass.text)
                      .then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginScreen()));
                    Fluttertoast.showToast(msg: "Successfully Register");
                  }).onError((FirebaseAuthException e, stackTrace) {
                    Fluttertoast.showToast(msg: e.message.toString());
                  });
                } on FirebaseAuthException catch (e) {
                  print(e);
                }

                }

              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black,
                ),
                height: 50,
                width: MediaQuery.of(context).size.width*0.5,
                child:Text("REGISTER",style: TextStyle( fontSize: 18,
                    color: Colors.white)
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),

            //REGISTER TXT
            Center(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Already Have an Account? ",style: TextStyle( fontSize: 15,
                          color: Color(0xff000000)),),
                      InkWell(
                        onTap: ()  {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        },
                        child: Text("Login",style: TextStyle( fontSize: 15,
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
    );
  }
}
