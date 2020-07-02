import 'package:chatapptutorial/services/auth.dart';
import 'package:chatapptutorial/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();

  final formKey = GlobalKey<FormState>();

  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  signMeUp(){
    if(formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });

      authMethods.signUpWithEmailAndPassword(emailTextEditingController.text,
          passwordTextEditingController.text).then((val){
            print("$val");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading ? Container(
        child: Center(child: CircularProgressIndicator()),
      ):SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-50,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (val){
                          return val.isEmpty || val.length < 2 ? "Provide Username": null;
                        },
                        controller: userNameTextEditingController,
                        /*if we use userNameTextEditingController.text then it will provide us the text
                    that user has typed in the username text field same for email and password*/
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("Username"),
                      ),
                      TextFormField(
                        validator: (val){
                          return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                          null : "Enter correct email";
                        },
                        controller: emailTextEditingController,
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("Email"),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator:  (val){
                          return val.length < 6 ? "Enter Password 6+ characters" : null;
                        },
                        controller: passwordTextEditingController,
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("Password"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ), //to provide vertical height
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      "Forgot Password ?",
                      style: simpleTextStyle(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: (){
                    signMeUp();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [const Color(0xff007EF4), const Color(0xff2A75BC)],
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      'Sign Up',
                      style: mediumTextStyle(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Sign Up with Google',
                    style: TextStyle(
                      color: Colors.black ,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have account ? ", style: mediumTextStyle(),),
                    Text("Sign In now", style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      decoration: TextDecoration.underline,
                    ),),
                  ],
                ),
                SizedBox(
                  height: 50  ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
