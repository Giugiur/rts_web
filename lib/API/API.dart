import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/utils.dart';

class API {

  static const API_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiIxODczNjNiZS0xOWQ1LTRmMzQtYjZhYy01M2M5Y2I1NWJiYmIiLCJzdWIiOiI2YmQwMjg0Yi03ZTU1LTRhM2YtYTEwYi1kNTI4YjAwMjRlM2MiLCJpYXQiOjE3MDMwODk2OTV9.gfuWWKd7aLD06XpBLRfs2emTOFwb59bNMajIBH9j45Q';
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<http.Response> registerUser(String email, String uid) async {
    final url = Uri.parse('https://api.gameshift.dev/users');
    Map data = {
      'referenceId': uid,
      'email': email,
    };
    var body = json.encode(data);
    var response = await http.post(url,
        headers: {
          'accept': 'application/json',
          'x-api-key': API_KEY,
          'content-type': 'application/json'
        },
        body: body
    );
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  Future<http.Response> getUserDetails(String uid) async {
    final url = Uri.parse('https://api.gameshift.dev/users/$uid');

    var response = await http.get(url,
        headers: {
          'accept': 'application/json',
          'x-api-key': API_KEY,
          'content-type': 'application/json'
        },
    );
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  Future<http.Response> getUserAssets(String uid) async {
    final url = Uri.parse('https://api.gameshift.dev/users/1/assets'); //ToDo: Replace for $uid

    var response = await http.get(url,
      headers: {
        'accept': 'application/json',
        'x-api-key': API_KEY,
        'content-type': 'application/json'
      },
    );
    // print("${response.statusCode}");
    // print("${response.body}");
    return response;
  }

  Future<List<dynamic>> getNFTs() async{
    var ret = [];
    print('getting NFTs');
    await db.collection("nfts").get().then((event) {
      for (var doc in event.docs) {
        // print("${doc.id} => ${doc.data()}");
        ret.add({
          'id': doc.id,
          'data': doc.data(),
        });
      }
    });
    return ret;
  }

  Future<List<dynamic>> getPassives() async{
    var ret = [];
    print('getting passives');
    await db.collection("passives").get().then((event) {
      for (var doc in event.docs) {
        // print("${doc.id} => ${doc.data()}");
        ret.add({
          'id': doc.id,
          'data': doc.data(),
        });
      }
    });
    return ret;
  }

}