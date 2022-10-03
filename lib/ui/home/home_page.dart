import 'package:default_project/cubits/counter/counter_cubit.dart';
import 'package:default_project/cubits/helper/helpers_cubit.dart';
import 'package:default_project/utils/constants.dart';
import 'package:default_project/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
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
    Stream<DateTime> myStream() async* {
      while (true) {
        await Future.delayed(const Duration(seconds: 1));
        yield DateTime.now();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: double.infinity),
          StreamBuilder<DateTime>(
            stream: myStream(),
            builder: (context, AsyncSnapshot<DateTime> data) {
              if (data.hasData) {
                var t = data.data!;
                return Text(
                  "My CLOCK :${DateFormat.jms().format(t)}",
                  style: MyTextStyle.sfProBold.copyWith(fontSize: 32),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, booksPage);
            },
            child: const Text("Books Page"),
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<HelpersCubit>(context).getLanguages();
              Navigator.pushNamed(context, languagesPage);
            },
            child: const Text("Languages Page"),
          ),
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Text(
                state.toString(),
                style: MyTextStyle.sfProBold.copyWith(fontSize: 32),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
