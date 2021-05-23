import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json App"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString("demojson/demo.json"),
            builder: (context, snapshot) {
              print(snapshot.data);
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Name: " + mydata[index]["name"]),
                        Text("Age: " + mydata[index]["age"]),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
