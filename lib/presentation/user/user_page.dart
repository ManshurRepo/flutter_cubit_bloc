import 'package:flutter/material.dart';
import 'package:flutter_cubit_bloc/application/user/controller/user_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'widgets/add_user_dialogue.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (userController) => Scaffold(
        body: ListView.builder(
            itemCount: userController.getListUserData.length,
            itemBuilder: (context, index) => Slidable(
              startActionPane: ActionPane(motion: ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (context) => {
                        userController.deleteDataOnList(userController.getListUserData[index]),
                      } ,
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ]),

              child: ListTile(
                    title: Text(userController.getListUserData[index].name!),
                    subtitle: Text("${userController.getListUserData[index].job!} \n ${userController.getListUserData[index].createdAt}"),
                    isThreeLine: true,
                    leading: Text(userController.getListUserData[index].id!),
                  ),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
                title: "Add new user", content: AddUserDialogue());
          },
          child: Text("Add"),
        ),
      ),
    );
  }
}
