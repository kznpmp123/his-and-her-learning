
import 'package:flutter/material.dart';

final String appName = "KZN Learning";
// production server http://13.213.196.157:8000 2021-10-08 Updated
// development server http://192.168.1.2:8000
// http://127.0.0.1:8000/
final String backendApiServer = 'http://52.47.195.138:8080';
//final String backendApiServer = 'http://127.0.0.1:8000';
final String apiVersion = backendApiServer+'';
final String loginEndpoint = apiVersion+'/api/token/';
final String courseEndpoint = apiVersion+'/courses/';
final String subscriptionEndpoint = apiVersion+'/subscriptions/';

final String appIconAsset = "assets/images/app_icon.png";
final String appIconUrl = "https://i.ibb.co/LRZR7DT/app-icon.png";

final Color tileColor = Colors.yellow;
final Color iconColor = Colors.black;

final String fbProtocolUrl = "fb://page/140463763219033"; // 140463763219033 KZN  Project Management
final String fallbackUrl = "https://www.facebook.com/kznprojectmanagement";


final List<String> introSliderImages = [
  "assets/images/slider/1.png",
  "assets/images/slider/2.png",
  "assets/images/slider/3.png"
];
