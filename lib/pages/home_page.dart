import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:testing/models/ulbum_model.dart';
import 'package:testing/pages/account_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//state to hold future album instance

  late Future<Album> futureAlbum;
  //called on page load and updates our album state
  @override
  void initState() {
    super.initState();
    //sets the album to the response of our fetch
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // initState();
          //code to refresh data on click
        },
        child: Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text("get data"),
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              const Text(
                "something",
                style: TextStyle(fontSize: 30.0),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "anything",
                style: TextStyle(fontSize: 30.0),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountPage()),
                  );
                }),
                child: const Text("PRESS ME "),
              ),
              const SizedBox(height: 20.0),
              // ElevatedButton(
              //   onPressed: (() {
              //     futureAlbum = fetchAlbum();
              //   }),
              //   child: const Text("GET DATA"),
              // ),
              Container(
                //future builder after the call

                child: FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        "${snapshot.data!.title}",
                        style: const TextStyle(fontSize: 30.0),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//function to get data and print the json format of it

// void getData() async {
//   // var url = Uri.https("jsonplaceholder.typicode.com", "/albums/1");
//   var url = Uri.https("akili-backend.herokuapp.com", "/api/v1/members");
//   var response = await http.get(url);
//   print(response.body);
// }

Future<Album> fetchAlbum() async {
  var url = Uri.https("jsonplaceholder.typicode.com", "/albums/1");
  final response = await http.get(url);
  // print(convert.jsonDecode(response.body));
  if (response.statusCode == 200) {
    // print(Album.fromJson(convert.jsonDecode(response.body)));
    return Album.fromJson(convert.jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
