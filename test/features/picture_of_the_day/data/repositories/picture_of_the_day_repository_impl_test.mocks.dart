// Mocks generated by Mockito 5.4.3 from annotations
// in nasapic/test/features/picture_of_the_day/data/repositories/picture_of_the_day_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:nasapic/core/network/network_info.dart' as _i6;
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_local_data_source.dart'
    as _i5;
import 'package:nasapic/features/picture_of_the_day/data/data_sources/picture_of_the_day_remote_data_source.dart'
    as _i3;
import 'package:nasapic/features/picture_of_the_day/data/models/picture_item_model.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePictureItemModel_0 extends _i1.SmartFake
    implements _i2.PictureItemModel {
  _FakePictureItemModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IPictureOfTheDayRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIPictureOfTheDayRemoteDataSource extends _i1.Mock
    implements _i3.IPictureOfTheDayRemoteDataSource {
  @override
  _i4.Future<List<_i2.PictureItemModel>> getAllPictures(
    int? page,
    int? count,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllPictures,
          [
            page,
            count,
          ],
        ),
        returnValue: _i4.Future<List<_i2.PictureItemModel>>.value(
            <_i2.PictureItemModel>[]),
        returnValueForMissingStub: _i4.Future<List<_i2.PictureItemModel>>.value(
            <_i2.PictureItemModel>[]),
      ) as _i4.Future<List<_i2.PictureItemModel>>);

  @override
  _i4.Future<_i2.PictureItemModel> searchPictureByDate(DateTime? date) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchPictureByDate,
          [date],
        ),
        returnValue:
            _i4.Future<_i2.PictureItemModel>.value(_FakePictureItemModel_0(
          this,
          Invocation.method(
            #searchPictureByDate,
            [date],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.PictureItemModel>.value(_FakePictureItemModel_0(
          this,
          Invocation.method(
            #searchPictureByDate,
            [date],
          ),
        )),
      ) as _i4.Future<_i2.PictureItemModel>);
}

/// A class which mocks [IPictureOfTheDayLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIPictureOfTheDayLocalDataSource extends _i1.Mock
    implements _i5.IPictureOfTheDayLocalDataSource {
  @override
  _i4.Future<List<_i2.PictureItemModel>> getAllPictures() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllPictures,
          [],
        ),
        returnValue: _i4.Future<List<_i2.PictureItemModel>>.value(
            <_i2.PictureItemModel>[]),
        returnValueForMissingStub: _i4.Future<List<_i2.PictureItemModel>>.value(
            <_i2.PictureItemModel>[]),
      ) as _i4.Future<List<_i2.PictureItemModel>>);

  @override
  _i4.Future<_i2.PictureItemModel> searchPictureByDate(DateTime? date) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchPictureByDate,
          [date],
        ),
        returnValue:
            _i4.Future<_i2.PictureItemModel>.value(_FakePictureItemModel_0(
          this,
          Invocation.method(
            #searchPictureByDate,
            [date],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.PictureItemModel>.value(_FakePictureItemModel_0(
          this,
          Invocation.method(
            #searchPictureByDate,
            [date],
          ),
        )),
      ) as _i4.Future<_i2.PictureItemModel>);

  @override
  _i4.Future<void> savePictures(List<_i2.PictureItemModel>? pictures) =>
      (super.noSuchMethod(
        Invocation.method(
          #savePictures,
          [pictures],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> cleanCache() => (super.noSuchMethod(
        Invocation.method(
          #cleanCache,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [INetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockINetworkInfo extends _i1.Mock implements _i6.INetworkInfo {
  @override
  String get checkUrl => (super.noSuchMethod(
        Invocation.getter(#checkUrl),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#checkUrl),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#checkUrl),
        ),
      ) as String);

  @override
  _i4.Future<bool> isConnected() => (super.noSuchMethod(
        Invocation.method(
          #isConnected,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}
