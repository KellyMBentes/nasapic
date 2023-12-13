import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasapic/features/picture_of_the_day/presentation/bloc/picture_of_the_day_bloc.dart';
import 'package:nasapic/features/picture_of_the_day/presentation/widgets/pictures_list_view.dart';
import 'package:nasapic/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Env.dev);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<PictureOfTheDayBloc>()..add(const PictureOfTheDayEvent.getAllPictures(1)),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(body: PicturesListView()),
    );
  }
}
