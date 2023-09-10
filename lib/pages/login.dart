import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/components/alert.dart';
import 'package:my_app/controllers/loginCtr.dart';

class Login extends GetView<LoginCtr> {
  @override
  final LoginCtr controller = Get.put(LoginCtr());
  final formKey = GlobalKey<FormState>();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: Form(
            key: formKey,
            child: Column(children: [
              Row(
                children: [
                  const Text('ID: '),
                  Expanded(child:  TextFormField(

                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'What do people call you?',
                      labelText: 'ID *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비어있다.';
                      }
                      controller.id.value = value;
                      return null;
                    },
                  ))
                ],
              ),
              Row(
                children: [
                  const Text('PW: '),
                  Expanded(child:  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'What do people call you?',
                      labelText: 'PW *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비어있다.';
                      }
                      controller.pw.value = value;
                      return null;
                    },
                  )),
                ],
              ),
              FilledButton(
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) return; 
                        var ans = await Future(() {
                          if (controller.id.value == 'test' &&
                              controller.pw.value == 'test') return true;
                          return false;
                        });
                        if (ans) {
                          Alert(label: 'success', onPressed: () {}).confirm();
                        }
                      },
                      child: const Text('로그인하자'))
            ]))));
  }
}
