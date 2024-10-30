import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc/application/profile/bloc/profileb_bloc.dart';
import 'package:flutter_cubit_bloc/domain/auth/model/login_response_model.dart';
import 'package:flutter_cubit_bloc/infrastructure/profile/profile_repository.dart';
import 'package:flutter_cubit_bloc/presentation/sign_in_page.dart/sign_in_page.dart';

import 'package:flutter_cubit_bloc/utils/constant.dart' as constant;
import 'package:get_storage/get_storage.dart';
import '../../domain/core/user/model/user_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginResponseModel? _loginResponseModel;

  // @override
  // void initState() {
  //   final _data = GetStorage().read(constant.userLocalKey);
  //   _loginResponseModel = LoginResponseModel.fromJson(jsonDecode(_data));
  //   super.initState();
  // }

  void initState() {
    super.initState();
    final _data = GetStorage().read(constant.userLocalKey);

    if (_data != null) {
      _loginResponseModel = LoginResponseModel.fromJson(jsonDecode(_data));
    } else {
      _loginResponseModel = LoginResponseModel(token: "Token tidak tersedia");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilebBloc(ProfileRepository())
        ..add(const ProfilebEvent.getAllUserData()),
      child: BlocConsumer<ProfilebBloc, ProfilebState>(
        listener: (context, state) {
          // TODO: implement listener
          state.maybeMap(
            orElse: () {},
            isLoading: (value) {
              print("isLoading");
            },
            isSuccess: (value) {
              print(value.userResponse.toJson());
            },
          );
        },
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => HomePageError(context),
            isLoading: (value) => HomePageLoading(),
            isSuccess: (value) => HomePageSuccess(value.userResponse.data!),
            isError: (value) => HomePageError(context),
          );
        },
      ),
    );
  }

  Scaffold HomePageError(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                context
                    .read<ProfilebBloc>()
                    .add(ProfilebEvent.getAllUserData());
              },
              icon: const Icon(Icons.replay),
            ),
            const Text("Halaman Error"),
          ],
        ),
      ),
    );
  }

  Scaffold HomePageLoading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Scaffold HomePageSuccess(List<UserData> _data) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loginResponseModel?.token ?? "Token Tidak Tersedia"),
        actions: [
          IconButton(
              onPressed: () {
                GetStorage().erase();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SignInPage(),
                  ),
                );
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) => (ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_data[index].avatar!),
          ),
          title: Text(_data[index].firstName!),
          subtitle: Text(_data[index].email!),
        )),
      ),
    );
  }
}
