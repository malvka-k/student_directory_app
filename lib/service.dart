import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> addstudent(
  String name,
  String rollno,
  String course,
  BuildContext context,
) async {
  try {
    await FirebaseFirestore.instance.collection("Datas").add({
      "Name": name,
      "RollNo": rollno,
      "Course": course,
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Student added Successfully")));
    // ignore: empty_catches
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

// ignore: non_constant_identifier_names
Stream<QuerySnapshot> Getstudents() {
  return FirebaseFirestore.instance.collection("Datas").snapshots();
}

Future<void> Deletestudent(String id, BuildContext context) async {
  try {
    await FirebaseFirestore.instance.collection("Datas").doc(id).delete();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Student Removed successfully")));

    // ignore: empty_catches
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> updatestudent(
  String id,
  String name,
  String rollno,
  String course,
  BuildContext context,
) async {
  try {
    await FirebaseFirestore.instance.collection("Datas").doc(id).update({
      "Name": name,
      "RollNo": rollno,
      "Course": course,
    });
     ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Updated successfully")));

  } catch (e) {ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));

  }
}
