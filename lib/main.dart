import 'package:flutter/material.dart';
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_remote_data_source.dart';
import 'package:nasapic/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Env.dev);
  runApp(const MyApp());
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
      home: Scaffold(
        body: FutureBuilder(
          future: getIt<PictureOfTheDayRemoteDataSourceImpl>().getAllPictures(2, 10),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final pictures = snapshot.data;
              if (pictures == null) return Container();

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: pictures.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(pictures[index].title),
                      Image.network(
                        pictures[index].mediaType == 'video' ? pictures[index].thumbnailUrl! : pictures[index].url,
                      ),
                    ],
                  );
                },
              );

              // return snapshot.data!.fold(
              // (f) => const Text('Error'),
              // (pictures) => ListView.builder(
              //   physics: const BouncingScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: pictures.length,
              //   itemBuilder: (BuildContext context, int index) {

              // return Column(
              //   children: [
              //     Text(pictures[index].title),
              //     Image.network(
              //       pictures[index].imageUrl,
              //     ),
              //   ],
              // );
              //     },
              //   ),
              // );
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
