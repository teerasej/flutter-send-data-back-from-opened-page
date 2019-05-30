import 'package:flutter/material.dart';
import 'package:nextflow_create_form_back_to_home/create_page.dart';
import 'package:nextflow_create_form_back_to_home/models/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nextflow Return Data to Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Nextflow Return Data to Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return CreatePage();
              }));

              print(result.username);

              setState(() {
                _user = result as UserModel;
              });
            },
          )
        ],
      ),
      body: Center(
        child: _user == null
            ? Text('create new user')
            : Text('${_user.username} ${_user.password}'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
