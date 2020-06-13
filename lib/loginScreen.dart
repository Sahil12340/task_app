import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'itemDetails.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isClickedCustomer = true;
  bool isClickedVendor = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20.0, bottom: 30.0),
            child: new Image.asset(
              'assets/images/fruit.webp',
              fit: BoxFit.cover,
              height: 180,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new SizedBox(
                width: 180,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: _toggleIsClicked,
                  color: (isClickedCustomer ? Colors.green : Colors.grey),
                  textColor: Colors.white,
                  child: Text("Customer",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(width: 10),
              new SizedBox(
                width: 180,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: _toggleIsClicked,
                  color: (isClickedVendor ? Colors.green : Colors.grey),
                  textColor: Colors.white,
                  child: Text("Vendor",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 35.0, top: 20.0, right: 35.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                labelText:
                    isClickedCustomer ? 'Customer Username' : "Vendor Username",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 35.0, top: 20.0, right: 35.0),
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 20.0, right: 35.0),
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  letterSpacing: 0.2,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: new SizedBox(
              width: 380,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.green)),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs?.setBool("isLoggedIn", true);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext ctx) => ItemDetail()));
                },
                color: Colors.green,
                textColor: Colors.white,
                child:
                    Text("Login".toUpperCase(), style: TextStyle(fontSize: 14)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40.0, bottom: 10),
            alignment: Alignment.center,
            child: Text(
              "SignUp",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            alignment: Alignment.center,
            child: Text(
              "POWERED BY",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, top: 0.0),
            child: new Image.asset('assets/images/logo.jpg'),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: new SizedBox(
              width: 150,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.green)),
                color: Colors.white,
                textColor: Colors.green,
                padding: EdgeInsets.all(8.0),
                onPressed: () {},
                child: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void _toggleIsClicked() {
    setState(() {
      if (!isClickedVendor) {
        isClickedVendor = true;
        isClickedCustomer = false;
      } else {
        isClickedVendor = false;
        isClickedCustomer = true;
      }
    });
  }
}
