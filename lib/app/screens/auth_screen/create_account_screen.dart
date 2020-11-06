import 'package:TSWEarn/app/Bottom_navigation/home.dart';
import 'package:TSWEarn/app/services/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:TSWEarn/app/widgets/auth_screen_widgets/build_button.dart';
import 'package:TSWEarn/app/widgets/auth_screen_widgets/text_field_container.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String fullName = '';
  String username = '';
  String email = '';
  String password = '';
  var _isLoading = false;
  bool _isLoggedIn = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Auth auth = Auth();

  Auth auht = Auth();

  void _showErrorDailog(String errorMessage) {
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
    await auht.signup(fullName, username, email, password).whenComplete(() {
      if (auht.status) {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => Home(),
          ),
          (Route<dynamic> route) => false,
        );
      } else {
        setState(() {
          _isLoading = false;
        });
        _showErrorDailog('${auht.errorMessage}');
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

  bool isLoggedIn = false;

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult = await facebookLogin.logIn(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        onLoginStatusChanged(true);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => Home(),
          ),
              (Route<dynamic> route) => false,
        );
        break;
    }
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
                top: 40,
                left: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 50,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                top: 90,
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Positioned(
                top: 130,
                child: Container(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  height: 250,
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
                                  hintText: 'Full name',
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[400],
                                  ),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Name can\'t be empty!';
                                  }
                                },
                                onSaved: (value) {
                                  fullName = value.trim();
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFieldsContainer(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'User name',
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[400],
                                  ),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'username can\'t be empty!';
                                  }
                                },
                                onSaved: (value) {
                                  username = value.trim();
                                },
                              ),
                            ),
                            SizedBox(height: 10),
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
                            SizedBox(height: 10),
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
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 150,
                child: InkWell(
                  onTap: _submit,
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : BuildButton(
                          width: 190,
                          text: 'Sign up',
                          color: Colors.white,
                          textColor: Theme.of(context).primaryColor,
                        ),
                ),
              ),
              Positioned(
                bottom: 90,
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        initiateFacebookLogin();
                      },
                      child: Image.asset(
                        'assets/images/facebook.png',
                        fit: BoxFit.cover,
                        width: 30,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () async{
                        _login();
                        _gsubmit();
                      },
                      child: Image.asset(
                        'assets/images/google.png',
                        fit: BoxFit.cover,
                        width: 30,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}