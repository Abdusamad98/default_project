
import 'package:default_project/cubits/counter/counter_cubit.dart';
import 'package:default_project/ui/home/cubit/home_cubit.dart';
import 'package:default_project/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = HomeCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    otherPage,
                  );
                },
                icon: Icon(Icons.new_releases))
          ],
        ),
        body: BlocBuilder<HomeCubit, int>(
          builder: (context, state) {
            return Center(
              child: Text("My number value:$state"),
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                bloc.increment();
                context.read<CounterCubit>().increment();
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () => bloc.decrement(),
              child: const Icon(Icons.remove),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              heroTag: "btn3",
              onPressed: () => Navigator.pushNamed(context, usersPage),
              child: const Icon(Icons.people),
            ),
          ],
        ),
      ),
    );
  }
}
