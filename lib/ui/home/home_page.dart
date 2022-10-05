import 'package:default_project/cubits/validator/validator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        children: [
          BlocBuilder<ValidatorCubit, ValidatorState>(
            builder: (context, state) {
              if (state is ValidatePhoneInput) {
                return Center(
                  child: Text("My number value:${state.validatedText}"),
                );
              }
              return const SizedBox();
            },
          ),
          BlocSelector<ValidatorCubit, ValidatorState, User>(
            selector: (state) {
              if (state is ValidatePhoneInput) {
                return User(
                    userName: "Abdulloh", age: int.parse(state.validatedText));
              } else {
                return User(userName: "Empty username", age: 0);
              }
            },
            builder: (context, newState) {
              return Text(newState.toString());
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                context.read<ValidatorCubit>().validateMyPhoneInput(value);
              },
            ),
          )
        ],
      ),
    );
  }
}

class User {
  User({required this.age, required this.userName});

  final String userName;
  final int age;

  @override
  String toString() {
    return '''
        USERNAME: $userName,
        AGE: $age
    ''';
  }
}
