// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_cubit_bloc/application/user/controller/user_controller.dart';
// import 'package:get/get.dart';

// import '../../../application/user/cubit/user_cubit.dart';
// import '../../../domain/core/user/model/user_req_res.dart';

// class AddUserDialogue extends StatefulWidget {
//   const AddUserDialogue({
//     super.key,
//   });

//   @override
//   State<AddUserDialogue> createState() => _AddUserDialogueState();
// }

// class _AddUserDialogueState extends State<AddUserDialogue> {
//   final nameController = TextEditingController();
//   final jobController = TextEditingController();
//   final userController = Get.put(UserController());
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => UserCubit(),
//       child: BlocConsumer<UserCubit, UserState>(
//         listener: (context, state) {
//           state.maybeMap(
//             orElse: () => {print('None')},
//             success: (value) => {
//               userController.addDataToList(value.userData),
//               print(value.userData.toString()),
//               Navigator.pop(context)
//             },
//           );
//         },
//         builder: (context, state) {
//           return Column(
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                   hintText: "Name",
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: jobController,
//                 decoration: InputDecoration(
//                   hintText: "Job",
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 height: 40,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     print(nameController.text);
//                     print(jobController.text);
//                     final _data = RequestData(
//                         name: nameController.text, job: jobController.text);
//                     context.read<UserCubit>().createNewUser(_data);
//                   },
//                   child: Text("Save"),
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc/application/user/controller/user_controller.dart';
import 'package:get/get.dart';

import '../../../application/user/cubit/user_cubit.dart';
import '../../../domain/core/user/model/user_req_res.dart';

class AddUserDialogue extends StatefulWidget {
  const AddUserDialogue({
    super.key,
  });

  @override
  State<AddUserDialogue> createState() => _AddUserDialogueState();
}

class _AddUserDialogueState extends State<AddUserDialogue> {
  final nameController = TextEditingController();
  final jobController = TextEditingController();
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () => print('None'),
            success: (value) {
              userController.addDataToList(value.userData);
              print(value.userData.toString());
              Navigator.pop(context);
            },
            error: (error) {
              print("Error: ${error.error}");
            },
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeMap(
            loading: (_) => true,
            orElse: () => false,
          );

          return Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: jobController,
                decoration: InputDecoration(
                  hintText: "Job",
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          print(nameController.text);
                          print(jobController.text);
                          final _data = RequestData(
                            name: nameController.text,
                            job: jobController.text,
                          );
                          context.read<UserCubit>().createNewUser(_data);
                        },
                  child: isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            color: Colors.white,
                          ),
                        )
                      : Text("Save"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
