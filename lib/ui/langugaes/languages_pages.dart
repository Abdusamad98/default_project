import 'package:default_project/cubits/helper/helpers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagesPage extends StatelessWidget {
  const LanguagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Languages"),
      ),
      body: BlocBuilder<HelpersCubit, HelpersState>(builder: (context, state) {
        if (state is GetLanguagesInSuccess) {
          return ListView(
            children: List.generate(
              state.languages.length,
              (index) => ListTile(
                title: Text(state.languages[index].name),
              ),
            ),
          );
        }
        if (state is GetLanguagesInProgress) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetLanguagesInFailure) {
          return Center(
            child: Text(
              state.errorText,
            ),
          );
        }
        return const SizedBox();
      }),
    );
  }
}
