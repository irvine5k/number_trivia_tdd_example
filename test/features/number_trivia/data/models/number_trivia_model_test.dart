import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia_tdd/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: "text test");

  test(
    "should be a subclass of number trivia entitity",
    () async {
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group(
    'fromJson',
    () {
      test(
        'should return a valid model when the json number is an integer',
        () async {
          final Map<String, dynamic> jsonMap =
              jsonDecode(fixture('trivia_double.json'));

          final result = NumberTriviaModel.fromJson(jsonMap);

          expect(result, tNumberTriviaModel);
        },
      );

      test(
        'should return a valid model when the json number is a double',
        () async {
          final Map<String, dynamic> jsonMap =
              jsonDecode(fixture('trivia.json'));

          final result = NumberTriviaModel.fromJson(jsonMap);

          expect(result, tNumberTriviaModel);
        },
      );
    },
  );

  group(
    'toJson',
    () {
      test('shoul return a JSON map containing the proper data', () async {
        final result = tNumberTriviaModel.toJson();

        final expectedMap = {
          "text": "text test",
          "number": 1,
        };
        
        expect(result, expectedMap);
      });
    },
  );
}
