import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movies_consumer/providers/movie_provider.dart';
import 'package:movies_consumer/screens/main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: ((context) => MoviesProvider()),
        lazy: false,
      )
    ], child: Main());
  }
}
