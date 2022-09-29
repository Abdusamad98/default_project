import 'package:default_project/cubits/user/user_cubit.dart';
import 'package:default_project/ui/widgest/custom_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users list by cubit "),
      ),
      body: Column(
        children: [
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UsersGetInProgress) {
                return const CustomCircularProgressbar();
              } else if (state is UsersGetInFailure) {
                return Center(
                  child: Text(state.errorText),
                );
              } else if (state is UsersGetInSuccess) {
                return Expanded(
                  child: ListView(
                    children: List.generate(
                        state.users.length,
                            (index) => ListTile(
                          title: Text(state.users[index].username),
                          subtitle: Text(state.users[index].email),
                        )),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserCubit>().fetchUsers();
        },
        child: const Icon(
          Icons.get_app
        ),
      ),
    );
  }
}
