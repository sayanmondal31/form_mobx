import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_mobx/services/form_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<FormStore>(
      create: (_) => FormStore(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FormPage(),
      ),
    );
  }
}

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<FormStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("form with mobx"),
      ),
      body: Container(
        child: Column(
          children: [
            Observer(builder: (_) {
              return TextField(
                onChanged: (name) {
                  store.name = name;
                },
                decoration: InputDecoration(
                    hintText: 'enter name', errorText: store.error.username),
              );
            }),
            Observer(builder: (_) {
              return TextField(
                onChanged: (email) {
                  store.email = email;
                },
                decoration: InputDecoration(
                    hintText: "enter email", errorText: store.error.email),
              );
            }),
            Observer(builder: (_) {
              return TextField(
                onChanged: (pass) {
                  store.password = pass;
                },
                decoration: InputDecoration(
                    hintText: "enter password",
                    errorText: store.error.password),
              );
            }),
            RaisedButton(onPressed: () => store.validateAll())
          ],
        ),
      ),
    );
  }
}
