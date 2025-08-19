import 'package:flutter/material.dart';
import 'package:wordly/router/router.dart';
import 'package:wordly/ui/ui.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final _appRouter = AppRouter();

  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      
      routerConfig: _appRouter.config(),
    );
  }
}



