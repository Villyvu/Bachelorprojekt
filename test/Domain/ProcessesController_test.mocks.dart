// Mocks generated by Mockito 5.0.7 from annotations
// in eventlog/test/Domain/ProcessesController_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:eventlog/Data/Db/DatabaseHandler.dart' as _i3;
import 'package:eventlog/Data/Event.dart' as _i6;
import 'package:eventlog/Data/Proces.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite_common/sqlite_api.dart' as _i2;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeDatabase extends _i1.Fake implements _i2.Database {}

/// A class which mocks [DatabaseHandler].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHandler extends _i1.Mock implements _i3.DatabaseHandler {
  MockDatabaseHandler() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get title =>
      (super.noSuchMethod(Invocation.getter(#title), returnValue: '')
          as String);
  @override
  _i4.Future<_i2.Database> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<_i2.Database>.value(_FakeDatabase()))
          as _i4.Future<_i2.Database>);
  @override
  _i4.Future<_i2.Database> initDatabase() =>
      (super.noSuchMethod(Invocation.method(#initDatabase, []),
              returnValue: Future<_i2.Database>.value(_FakeDatabase()))
          as _i4.Future<_i2.Database>);
  @override
  void deleteTable() => super.noSuchMethod(Invocation.method(#deleteTable, []),
      returnValueForMissingStub: null);
  @override
  void createTables() =>
      super.noSuchMethod(Invocation.method(#createTables, []),
          returnValueForMissingStub: null);
  @override
  void fillTable() => super.noSuchMethod(Invocation.method(#fillTable, []),
      returnValueForMissingStub: null);
  @override
  _i4.Future<List<_i5.Proces>> readProcesses(int? cpr) =>
      (super.noSuchMethod(Invocation.method(#readProcesses, [cpr]),
              returnValue: Future<List<_i5.Proces>>.value(<_i5.Proces>[]))
          as _i4.Future<List<_i5.Proces>>);
  @override
  _i4.Future<List<_i6.Event>> readEvents(int? procesID) =>
      (super.noSuchMethod(Invocation.method(#readEvents, [procesID]),
              returnValue: Future<List<_i6.Event>>.value(<_i6.Event>[]))
          as _i4.Future<List<_i6.Event>>);
  @override
  _i4.Future<List<_i6.Event>> readAllEvents(int? proces_id) =>
      (super.noSuchMethod(Invocation.method(#readAllEvents, [proces_id]),
              returnValue: Future<List<_i6.Event>>.value(<_i6.Event>[]))
          as _i4.Future<List<_i6.Event>>);
}
