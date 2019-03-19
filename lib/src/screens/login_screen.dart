import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  // Create GlobakKey that will reference a FormState object
  final formKey = GlobalKey<FormState>();

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        // associate formKey with FormState of Form
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: (String value) {
        if (!value.contains('@')) {
          return 'Plase enter a valid email';
        }
      },
      onSaved: (String value) {
        print(value);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: (String value) {
        if (value.length < 4) {
          return 'Password must be at least 4 characters';
        }
      },
      onSaved: (String value) {
        print(value);
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed: () {
        //get current state reference from formKey and call method on FormState
        // to validate fields in form
        // Each field must have a validator function assigned to it
        // that returns either null if valid or a string with error message
        // if not valid, the error message is displayed beneath the field
        if (formKey.currentState.validate()) {
          // call save method if form is valid
          // calling save will run the onSave function for each form field
          formKey.currentState.save();
        }
      },
    );
  }
}
