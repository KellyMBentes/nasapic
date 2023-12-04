import 'package:flutter/material.dart';
import 'package:nasapic/core/usecases/usecase.dart';
import 'package:nasapic/features/picture_of_the_day/domain/use_cases/get_all_pictures.dart';
import 'package:nasapic/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Env.demo);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: FutureBuilder(
          future: getIt<GetAllPictures>().call(const NoParams()),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.data!.fold(
                (f) => const Text('Error'),
                (pictures) => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pictures.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Text(pictures[index].title),
                        Image.network(
                          pictures[index].imageUrl,
                        ),
                      ],
                    );
                  },
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Text('Error');
            }
          }),
        ),
      ),
    );
  }
}
