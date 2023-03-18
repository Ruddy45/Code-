import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makig/home/Models.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  // i am making getting the link of the target api to which i am making my request to
  // And i am storing the base link inside a string variable i called "homelink"
String homelink = "https://jsonplaceholder.typicode.com";
// This right here is my future method that i will pick up my list of models and decode them using the jasonDecode function
  // for it being a future method this maks this an asynchronous method

  Map <String, String> header = {
  'content-type': 'application/json',
  'Accept': 'application/json',
};
  Future <List<DisplayMods>> getInfomation () async{
    /// This is an empty list that will store my decoded jason models
    List<DisplayMods> displaylist = [];

    Uri url = Uri.parse(homelink +"/photos");
    http.Response response =  await http.get(url,headers: header);
     /// Now i will decode the jason file gotten from the internet using a conditional statement
    /// This particular conditional statement is in search of the status code 200 which means the request was successful
  if (response.statusCode == 200) {
    List<dynamic> alllist = jsonDecode(response.body);
    displaylist = alllist.map((e) => DisplayMods.fromJson(e)).toList();
    return displaylist;

  }else{
    return displaylist;
  }}


}
