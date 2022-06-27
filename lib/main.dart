import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'home_module/bloc/home_bloc_bloc.dart';
import 'home_module/repository/home_screen_repository.dart';
import 'home_module/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Oro Sample',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey[200],
            ),
            backgroundColor: Colors.grey[200],
            brightness: Brightness.light,
          ),
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => Counter()),
              // BlocProvider(
              //   create: (_) => CounterBloc(),
              // ),
              BlocProvider(
                create: (context) => StoredItemsBloc(
                 storedItemRepo: StoredItemServices()),
              ),
            ],
            child: const HomeScreen(),
          ),
        );
      },
    );
  }

}


