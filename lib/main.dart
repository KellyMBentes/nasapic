import 'package:flutter/material.dart';
import 'package:nasapic/core/utils/date_helpers.dart';
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_local_data_source.dart';
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_remote_data_source.dart';
import 'package:nasapic/features/picture_of_the_day/data/models/picture_item_model.dart';
import 'package:nasapic/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Env.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    IPictureOfTheDayLocalDataSource localDataSource = getIt<IPictureOfTheDayLocalDataSource>();
    IPictureOfTheDayRemoteDataSource remoteDataSource = getIt<IPictureOfTheDayRemoteDataSource>();

    final List<PictureItemModel> pictures = [
      PictureItemModel(
        date: DateTime(2020, 11, 15).toStringRemote(),
        explanation:
            'Why is this galaxy so thin?  Many disk galaxies are just as thin as NGC 5866, pictured here, but are not seen edge-on from our vantage point.  One galaxy that is situated edge-on is our own Milky Way Galaxy.  Classified as a lenticular galaxy, NGC 5866 has numerous and complex dust lanes appearing dark and red, while many of the bright stars in the disk give it a more blue underlying hue.  The blue disk of young stars can be seen extending past the dust in the extremely thin galactic plane, while the bulge in the disk center appears tinged more orange from the older and redder stars that likely exist there. Although similar in mass to our Milky Way Galaxy, light takes about 60,000 years to cross NGC 5866, about 30 percent less than light takes to cross our own Galaxy. In general, many disk galaxies are very thin because the gas that formed them collided with itself as it rotated about the gravitational center. Galaxy NGC 5866 lies about 44 million light years distant toward the constellation of the Dragon (Draco).    Almost Hyperspace: Random APOD Generator',
        title: 'Edge-On Galaxy NGC 5866',
        url: 'https://apod.nasa.gov/apod/image/2011/ngc5866_hst_960.jpg',
        mediaType: 'photo',
      ),
      PictureItemModel(
        date: DateTime(2022, 06, 26).toStringRemote(),
        explanation:
            'What caused this outburst of V838 Mon?  For reasons unknown, star V838 Mon\'s outer surface suddenly greatly expanded with the result that it became one of the brighter stars in the  Milky Way Galaxy in early 2002.  Then, just as suddenly, it shrunk and faded.  A stellar flash like this had never been seen before -- supernovas and novas expel matter out into space.  Although the V838 Mon flash appears to expel material into space, what is seen in the featured image from the Hubble Space Telescope is actually an outwardly expanding light echo of the original flash.  In a light echo, light from the flash is reflected by successively more distant surfaces in the complex array of ambient interstellar dust that already surrounded the star.  V838 Mon lies about 20,000 light years away toward the constellation of the unicorn (Monoceros), while the light echo above spans about six light years in diameter.',
        title: 'Light Echoes from V838 Mon',
        url: 'https://apod.nasa.gov/apod/image/2206/V838Mon_Hubble_960.jpg',
        mediaType: 'photo',
      ),
      PictureItemModel(
        date: DateTime(2023, 10, 24).toStringRemote(),
        explanation:
            'Warm shades and subtle colors come to the sky in the fading sunlight after shadowrise on this little planet. Of course the little planet is planet Earth, and this nadir-to-zenith, around-the-horizon mosaic maps the view from a small airfield near the town of Intendente Alvear, La Pampa province, Argentina. Just above the western horizon (top) the sky shines with the warm colors of sunset. The slate blue shadow of Earth itself extending through the atmosphere can be seen rising as it hugs the eastern horizon (bottom). Wrapped closely above the narrow projection of Earth\'s shadow is the gentle glow of reddened, backscattered sunlight called the antitwilight arch or the Belt of Venus.',
        title: 'Little Planet Shadowrise',
        url: 'https://apod.nasa.gov/apod/image/1310/Enzo_De_Bernardini_Belt_of_Venus_tinyplanet.jpg',
        mediaType: 'photo',
      ),
      PictureItemModel(
        date: DateTime(2013, 08, 30).toStringRemote(),
        explanation:
            'These three bright nebulae are often featured in telescopic tours of the constellation Sagittarius and the crowded starfields of the central Milky Way. In fact, 18th century cosmic tourist Charles Messier cataloged two of them; M8, the large nebula left of center, and colorful M20 on the right. The third, NGC 6559, is above M8, separated from the larger nebula by a dark dust lane. All three are stellar nurseries about five thousand light-years or so distant. The expansive M8, over a hundred light-years across, is also known as the Lagoon Nebula. M20\'s popular moniker is the Trifid. Glowing hydrogen gas creates the dominant red color of the emission nebulae, with contrasting blue hues, most striking in the Trifid, due to dust reflected starlight. The colorful skyscape recorded with telescope and digital camera also includes one of Messier\'s open star clusters, M21, just above the Trifid.',
        title: 'A Sagittarius Triplet',
        url: 'https://apod.nasa.gov/apod/image/1308/SagTriplet6D_hallasNew950.jpg',
        mediaType: 'photo',
      )
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: FutureBuilder(
          future: remoteDataSource.getAllPictures(1, 10),
          // future: Future(() async {
          //   final result = await localDataSource.getAllPictures();
          //   if (result.isEmpty) {
          //     localDataSource.savePictures(pictures);
          //   }
          //   return await localDataSource.getAllPictures();
          // }),
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
