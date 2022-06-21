import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randi/data/providers/api.dart';
import 'package:randi/modules/controllers/home/home_controller.dart';
import 'package:randi/modules/repositories/home_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(
          HomeRepository(
            Get.find<ApiProvider>(),
          ),
        ),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Tester'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        final item = controller.users[index];
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              item.avatar,
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            ),
                          ),
                          title: Text('${item.firstName} ${item.lastName}'),
                          subtitle: Text(item.email),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller
                          .getUsers(); // panggil function getUsers() di dalem Controller
                      print(controller.users);
                    },
                    child: const Text('Get Users'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
