import 'dart:js';

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/widgets/bottom_bar.dart';

void main() {
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create:(context)=>UserProvider())
  ],child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService= AuthService();



  @override
  Widget build(BuildContext context) {
    authService.getUserData(context: context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Shop',
      onGenerateRoute: (settings)=>generateRoute(settings),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        colorScheme: const ColorScheme.light(primary: GlobalVariables.secondaryColor)
      ),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
           ? const BottomBar()
          : const AuthScreen(),
    );
  }

  @override
  void initState() {
    super.initState();

  }

}



