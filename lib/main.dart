import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:default_project/cubits/counter/counter_cubit.dart';
import 'package:default_project/cubits/products/products_cubit.dart';
import 'package:default_project/data/local/storage.dart';
import 'package:default_project/data/repositories/products_repository.dart';
import 'package:default_project/data/services/api_client.dart';
import 'package:default_project/data/services/api_provider.dart';
import 'package:default_project/ui/no_internet/no_internet_page.dart';
import 'package:default_project/ui/router.dart';
import 'package:default_project/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context) => CounterCubit()),
      BlocProvider(
        create: (BuildContext context) => ProductsCubit(
          productsRepository: ProductsRepository(
            apiProvider: ApiProvider(
              apiClient: ApiClient(),
            ),
          ),
        ),
      ),
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) {
          return StreamBuilder(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                if (snapshot.data == ConnectivityResult.none) {
                  return const NoInternetPage();
                }
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                      textScaleFactor: 1.0, alwaysUse24HourFormat: true),
                  child: child!,
                );
              });
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: MyRouter.generateRoute,
        initialRoute: splashPage // mainPage,
        );
  }
}

// Bo'yi umumiy screening 2/3 qismini tashkil etuvchi 4 ta to'g'ri to'rtburchak chizing.
//1- shart Ularning barchasi bitta widgetda vertikal scroll bo'ladi
//2- shart Harbir to'g'ri to'rtburchak BackgroundColor ga random rang olsin.
//3- shart Shu UI ni 2 xil usulda chizing.





