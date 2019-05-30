import 'package:flutter/material.dart';
import 'package:nextflow_create_form_back_to_home/models/user_model.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New User'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Username:'),
          TextFormField( controller: _usernameController,),
          Text('Password'),
          TextFormField(obscureText: true, controller: _passwordController,),
          RaisedButton(
            onPressed: () {

              var username = _usernameController.text;
              var password = _passwordController.text;

              var user = UserModel(username, password);
              
              Navigator.pop(context, user);

            },
            child: Text('Create'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          )
        ],
      ),
    );
  }
}
