import 'package:TSWEarn/app/Bottom_navigation/home.dart';
import 'package:TSWEarn/app/services/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:TSWEarn/app/screens/auth_screen/create_account_screen.dart';
import 'package:TSWEarn/app/screens/auth_screen/forget_password_screen.dart';
import 'package:TSWEarn/app/widgets/auth_screen_widgets/build_button.dart';
import 'package:TSWEarn/app/widgets/auth_screen_widgets/text_field_container.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login2Screen extends StatefulWidget {
  @override
  _Login2ScreenState createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = '';
  String password = '';
  var _isLoading = false;
  bool _isLoggedIn = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Auth auth = Auth();

  _login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
  }

  _logout() async{
    await _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  void _showErrorDailog(var errorMessage) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(errorMessage),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalide
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    await auth.login(email, password).whenComplete(() {
      if (auth.status) {
        setState(
          () {
            _isLoading = false;
          },
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => Home(),
          ),
          (Route<dynamic> route) => false,
        );
      } else {
        setState(
          () {
            _isLoading = false;
          },
        );
        _showErrorDailog('${auth.errorMessage}');
      }
    });
  }

  Future<void> _gsubmit() async {
    setState(() {
      _isLoading = true;
    });
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    AuthResult authResult = await _auth.signInWithCredential(credential);
    await googleSignInAccount.authentication.whenComplete(() {
        setState(
              () {
            _isLoading = false;
          },
        );
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => Home(),
          ),
              (Route<dynamic> route) => false,
        );
    });
  }



  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: deviceSize.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/curves.png',
                fit: BoxFit.cover,
                width: deviceSize.width,
              ),
              Positioned(
                top: 80,
                child: Image.asset(
                  'assets/images/person.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 210,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
                  height: 180,
                  width: 280,
                  child: Column(
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFieldsContainer(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Email Address',
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[400],
                                  ),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty || !value.contains('@')) {
                                    return 'Invalid Email!';
                                  }
                                },
                                onSaved: (value) {
                                  email = value.trim().toLowerCase();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFieldsContainer(
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[400],
                                  ),
                                  border: InputBorder.none,
                                ),
                                // ignore: missing_return
                                validator: (value) {
                                  if (value.isEmpty || value.length < 6) {
                                    return 'Password is too short';
                                  }
                                },
                                onSaved: (value) {
                                  password = value.trim();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 170,
                child: InkWell(
                  onTap: _submit,
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : BuildButton(
                          width: 190,
                          text: 'Log in',
                          color: Colors.white,
                          textColor: Theme.of(context).primaryColor,
                        ),
                ),
              ),
              Positioned(
                bottom: 130,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => ForgetPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Forget Password',
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 70,
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        // .... Sing in with facebook
                      },
                      child: Image.asset(
                        'assets/images/facebook.png',
                        fit: BoxFit.cover,
                        width: 35,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    InkWell(
                      onTap: () async{
                        _login();
                        _gsubmit();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent),
                        child: Image.asset(
                          'assets/images/google.png',
                          fit: BoxFit.cover,
                          width: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 40,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => CreateAccountScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}