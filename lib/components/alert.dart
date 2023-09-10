import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alert {
  var onPressed;
  String label = '';
  Alert({this.onPressed, required this.label});

  confirm() {
    return Get.defaultDialog(
        title: '',
        content: Expanded(
          flex: 1,
          
            child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Text(label),
            FilledButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber)),
              onPressed: () {
                onPressed();
                Get.close(0);
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            )
          ],
        )),
        radius: 10.0);
  }
}
