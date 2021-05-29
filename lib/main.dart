import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/rounded_button.dart';
import 'screens/home.dart';
import 'screens/tabBarView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool _rememberMe = false;
  String _password;
  String _email;
  final _correct_email = 'talha3111997@gmail.com';
  final _correct_password = '123456';
  showConfirmDialog(BuildContext context) {
    Widget confirmButton = TextButton(child: Text("Try Again"),
    onPressed: (){ Navigator.of(context).pop();} // dismiss dialog,
    );

    AlertDialog confirm = AlertDialog(
      title: Text("Wrong Credentials Dialog"),
      content: Text("Your entered email is: $_email and password is: $_password , which are incorrect"),
      actions: [confirmButton]
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return confirm;
      },
    );
  }


  void _togglePassword() {
    setState(
      () {
        _obscureText = !_obscureText;
      },
    );
  }

  void _toggleRememberMe(bool value) {
    setState(() {
      _rememberMe = value;
    });
  }
  LoginScackBar(){
    final snackBar = SnackBar(
      content: Text('Login! Successfully'),
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Sign in"),
          backgroundColor: Colors.deepOrangeAccent[200],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/talha.jpeg"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) => _email = value,
                    decoration: InputDecoration(
                      labelText: "User Name",
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    obscureText: _obscureText,
                    onChanged: (value) => _password = value,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.orange,
                      ),
                      suffixIcon: TextButton(
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Colors.orange,
                          semanticLabel: _obscureText ? "Show" : "Hide",
                        ),
                        onPressed: () => _togglePassword(),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: _rememberMe, onChanged: _toggleRememberMe),
                          Text("Remember Me"),
                        ],
                      ),
                      TextButton(
                        child: Text(
                          "Forgot Password",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  RoundedButton(
                      text: "LOGIN",
                      press: () => {(_email != null && _password != null) ? {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home(userName: _email,),),
                                    ),
                                    LoginScackBar()

                                  }
                                : showConfirmDialog(context)},
                      color: Colors.orange,
                      textColor: Colors.white),
                  RoundedButton(
                      text: "SIGNUP",
                      press: () => {},
                      color: Colors.orange.shade100,
                      textColor: Colors.black),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Drawer wow"),
              decoration: BoxDecoration(color: Colors.orangeAccent),
            ),
            ListTile(
              title: Text('wpw'),
              onTap: () {},
            ),
            ListTile(
              title: Text("wow2"),
              onTap: () {},
            )
          ],
        )));
  }
}
