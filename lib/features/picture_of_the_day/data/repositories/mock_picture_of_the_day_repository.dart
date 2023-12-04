import 'package:injectable/injectable.dart';
import 'package:nasapic/features/picture_of_the_day/domain/repositories/i_picture_of_the_day_repository.dart';
import 'package:nasapic/injection.dart';
import 'package:mockito/mockito.dart';

@Injectable(as: IPictureOfTheDayRepository, env: [Env.test])
class MockPictureOfTheDayRepository extends Mock implements IPictureOfTheDayRepository {}
