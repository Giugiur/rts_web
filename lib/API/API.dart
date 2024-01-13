import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rts_web/auth/auth_controller.dart';
import '../env/env.dart';
import '../utils/utils.dart';

class API {

  static const API_KEY = Env.GameshiftApiKey;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> createFirebaseUser(String email, String password) async {
    AuthController authController = Get.put(AuthController());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        registerUser(email, value.user!.uid);
        authController.signInUser();
        // TODO: If they were on the marketplace, redirect them
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // _passwordIsTooWeak = true;
      } else if (e.code == 'email-already-in-use') {
        //_emailAlreadyInUse = true;
      }
    } catch (e) {
      print(e);
    }
  }

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
    final url = Uri.parse('https://api.gameshift.dev/users/$uid/assets');

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

  Future<http.Response> assetTemplateCheckout(String assetTemplateID) async {
    final AuthController authController = Get.put(AuthController());
    final url = Uri.parse('https://api.gameshift.dev/asset-templates/$assetTemplateID/checkout');
    Map data = {
      'quantity': 1,
      'amountCents': 1000,
      'buyerId': authController.authUID,
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
    // print("${response.statusCode}");
    // print("${response.body}");
    return response;
  }

}