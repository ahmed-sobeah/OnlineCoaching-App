import 'package:ali_nasser_online_coaching_app/firebase_options.dart';
import 'package:ali_nasser_online_coaching_app/my_app/my_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.enableNetwork();
  runApp(const MyApp()  );
}


