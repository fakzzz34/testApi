import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/providers/api.dart';
import 'modules/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      initialBinding: BindingsBuilder(
        () async {
          Get.put(
            ApiProvider(),
            permanent: true,
          );
        },
      ),
    );
  }
}
