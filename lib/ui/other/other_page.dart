import 'package:default_project/cubits/counter/counter_cubit.dart';
import 'package:default_project/ui/other/cubit/other_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  final bloc = OtherCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: BlocBuilder<OtherCubit, int>(
          builder: (context, state) {
            return Center(
                child: Column(
              children: [
                Text("My local number value:$state"),
                Text("My global number value:${context.watch<CounterCubit>().state}"),
              ],
            ));
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () => bloc.increment(),
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () => bloc.decrement(),
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
