import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ink_me_up/src/models/user_profile.dart';
import 'package:ink_me_up/src/screens/home.dart';
import 'package:ink_me_up/src/screens/setup_profile_page.dart';
import 'package:ink_me_up/src/utils/utils.dart';

enum FormMode { LOGIN, SIGNUP }

class LoginSignUpPage extends StatefulWidget{
  @override
  State createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage>{

  var _email = '';
  var _password = '';
  var _isLoading = false;
  var _formMode = FormMode.LOGIN;
  var _errorMessage = '';
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  UserProfile userProfile;
  final _databaseReference = Firestore.instance;

  Widget _showCircularProgress(){
    if (_isLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    return helper.emptyContainer;
  }

  Widget _showLogo(){
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: helper.EDGEINSETS_LTRB_30T,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 80.0,
          child: Image.asset('assets/icon/inkmeup.png'),
        ),
      ),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: helper.EDGEINSETS_LTRB_100T,
      child: TextFormField(
        controller: _emailController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Email',
            icon: Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: helper.EDGEINSETS_LTRB_15T,
      child: TextFormField(
        controller: _passwordController,
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget _showPrimaryButton() {
    return Padding(
        padding: helper.EDGEINSETS_LTRB_45T,
        child: MaterialButton(
          elevation: 5.0,
          minWidth: 200.0,
          height: 42.0,
          color: Colors.indigo,
          child: _formMode == FormMode.LOGIN
              ? Text('Login',
              style: helper.authButton1Style)
              : Text('Create account',
              style: helper.authButton1Style),
          onPressed: _validateAndSubmit,
        ));
  }

  Widget _showSecondaryButton() {
    return FlatButton(
      child: _formMode == FormMode.LOGIN
          ? Text('Create an account',
          style: helper.authButton2Style)
          : Text('Have an account? Sign in',
          style:helper.authButton2Style),
      onPressed: (){
        if (_formMode == FormMode.LOGIN) {
          _changeFormToSignUp();
        }else{
          _changeFormToLogin();
        }
        _emailController.clear();
        _passwordController.clear();
      },
    );
  }

  void _changeFormToSignUp() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
      _formKey.currentState.reset();
    });
  }

  void _changeFormToLogin() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
      _formKey.currentState.reset();
    });
  }

  _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    String userId = "";
    try {
      if (_formMode == FormMode.LOGIN) {
        // login with existing user
        user = await _auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
        // check if user has already setup his account
        _databaseReference.collection('users')
            .where('user_id', isEqualTo: user.uid)
            .getDocuments()
            .then((QuerySnapshot snapshot){
              setState(() {
              userProfile = UserProfile.fromJson(snapshot.documents[0].data);
              });
              // if no user profile found (haven't set up yet), go to SetupProfilePage
              if (userProfile == null){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SetupProfilePage(
                          user: user.uid,
                        )));
              }else{
                // if user has already setup profile
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                          userProfile: userProfile,
                        )));
              }
        });
      } else {
        user = await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
        // proceed to setup account
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SetupProfilePage(
              user: user.uid,
            )
          )
        );
      }
      if (userId.length > 0 && userId != null) {
        print('error');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
        _errorMessage = e.message;
        _passwordController.clear();
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return Text(
        _errorMessage,
        style: helper.authErrorStyle,
      );
    } else {
      return Container(
        height: 0.0,
      );
    }
  }

  Widget _showBody(){
    return Container(
        padding: helper.EDGEINSETS_ALL_16,
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _showLogo(),
              _showEmailInput(),
              _showPasswordInput(),
              _showPrimaryButton(),
              _showSecondaryButton(),
              _showErrorMessage(),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login/Sign Up'),),
      ),
      body: Stack(
        children: <Widget>[
          _showBody(),
          _showCircularProgress(),
        ],
      ),
    );
  }
}

