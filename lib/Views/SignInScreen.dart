import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaplas_intern_project/Views/PageControllerScreen.dart';
import 'package:email_validator/email_validator.dart';
import 'SignUpScreen.dart';

class SignInScreen extends StatefulWidget {

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _formKey = GlobalKey<FormState>();
  String _email='',_password='';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade500,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                    top: MediaQuery.of(context).size.height*0.2,
                    left: MediaQuery.of(context).size.width*0.1,
                    child: Text('Welcome!!',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.white70),)),
                Positioned(
                    top: MediaQuery.of(context).size.height*0.35,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.65,
                      padding: EdgeInsets.only(top: 20,right: 20,left: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Sign In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade500,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        cursorColor: Colors.white70,
                                        decoration: InputDecoration(
                                          floatingLabelBehavior: FloatingLabelBehavior.never,
                                          labelText: 'Email:',
                                          alignLabelWithHint: true,
                                          labelStyle: TextStyle(color: Colors.white70,fontSize: 18,fontWeight: FontWeight.bold),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        onChanged: (value){
                                          _email = value;
                                        },
                                        onSaved: (value){
                                          _email = value.toString();
                                        },
                                        validator: (value){
                                            if(value!.isNotEmpty)
                                              {
                                                if(EmailValidator.validate(value))
                                                  {
                                                    //sign in code here
                                                  }
                                                else
                                                  {
                                                    return 'Invalid email';
                                                  }
                                              }
                                            else
                                              {
                                                return 'Email cannot be empty';
                                              }
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade500,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        obscureText: true,
                                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
                                        cursorColor: Colors.white70,
                                        decoration: InputDecoration(
                                          floatingLabelBehavior: FloatingLabelBehavior.never,
                                          labelText: 'Password:',
                                          alignLabelWithHint: true,
                                          labelStyle: TextStyle(color: Colors.white70,fontSize: 18,fontWeight: FontWeight.bold),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        onChanged: (value){
                                          _email = value;
                                        },
                                        onSaved: (value){
                                          _email = value.toString();
                                        },
                                        validator: (value){
                                          if(value!.isNotEmpty)
                                            {
                                              if(value.contains(' '))
                                                {
                                                  return 'Password cannot have spaces';
                                                }
                                              else
                                                {
                                                  //sign in here
                                                }
                                            }
                                          else{
                                            return 'Password is required';
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'forgot password',
                                      style: TextStyle(color: Colors.blue,fontWeight: FontWeight.normal,fontSize: 16,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  //button
                                  GestureDetector(
                                    onTap: (){

                                      if(_formKey.currentState!.validate())
                                        {

                                        }
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PageControllerScreen()));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade400,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text('Sign In',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                        height: 1,
                                        color: Colors.grey.shade400,
                                      ),
                                      Container(
                                        color: Colors.white,
                                        width: 140,
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Center(
                                          child: Text('Or Sign In With',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage(
                                          'assets/images/google.png',
                                        ),
                                      ),
                                      SizedBox(width: 20,),
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage(
                                          'assets/images/facebook.png',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                    },
                                    child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(text: 'Dont have an account?',style: TextStyle(color: Colors.black)),
                                            TextSpan(text: '  '),
                                            TextSpan(text: 'SignUp',style: TextStyle(color: Colors.orange)),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ),
                ),
              ],
            ),
          ),
        ),


      ),
    );
  }
}
