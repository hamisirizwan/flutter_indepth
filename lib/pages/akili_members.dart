import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AkiliMembersPage extends StatefulWidget {
  const AkiliMembersPage({Key? key}) : super(key: key);

  @override
  _AkiliMembersPageState createState() => _AkiliMembersPageState();
}

class _AkiliMembersPageState extends State<AkiliMembersPage> {
  late Future<List> members;
  @override
  void initState() {
    members = getMembers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AKILI YOUTH MEMBERS"),
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getMembers();
        },
        child: Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Container(
          child: FutureBuilder(
            future: members,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 25.0),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: ${snapshot.data[index]['firstname']}",
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text(
                                "id number: ${snapshot.data[index]['id_number']}",
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text("Phone No: ${snapshot.data[index]['phone']}",
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text(
                                "Residence: ${snapshot.data[index]['residence']}",
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
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
        ),
      ),
    );
  }
}

Future<List<dynamic>> getMembers() async {
  var response = await http
      .get(Uri.parse("https://akili-backend.herokuapp.com/api/v1/members"));
  return jsonDecode(response.body);
}

//put the separate card component here