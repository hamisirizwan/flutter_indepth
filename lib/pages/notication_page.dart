import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late Future<List> response;
  @override
  void initState() {
    response = fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LIST DATA")),
      body: FutureBuilder(
        future: response,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(snapshot.data[index]['name']['title'] +
                            " " +
                            snapshot.data[index]['name']['first'] +
                            " " +
                            snapshot.data[index]['name']['last']),
                        trailing:
                            Text(snapshot.data[index]['dob']['age'].toString()),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            snapshot.data[index]['picture']['large'],
                          ),
                        ),
                        subtitle: Text(snapshot.data[index]['email']),
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

//STEP 1

//function to fetch users from the json

Future<List<dynamic>> fetchUsers() async {
  var result =
      await http.get(Uri.parse("https://randomuser.me/api/?results=20"));
  return jsonDecode(result.body)['results'];
}

//STEP 2
//Call the function when component first mounts
    //in the initstate