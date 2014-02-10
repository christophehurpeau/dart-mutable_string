library mutable_string;

import 'dart:collection';

import 'package:multi_reg_exp/multi_reg_exp.dart';

part 'mutable_string_matches_iterable.dart';
part 'mutable_string_match.dart';

class MutableString implements StringContainer {
  String string;

  MutableString(this.string);

  @override
  Iterable<MutableStringMatch> allMatches(RegExp regExp) {
    return new MutableStringMatchesIterable(this,regExp);
  }

  @override
  Iterable<MutableStringMatch> allMatchesFromMultiRegExp(MultiRegExp multiRegExp) {
    return new MutableStringMatchesIterable(this,multiRegExp);
  }

  String substring(int startIndex, [int endIndex]) {
    return string = string.substring(startIndex, endIndex);
  }

  String trim() => string = string.trim();

  String replacePart(int startIndex, int endIndex, [String replacement = '']) {
    return string = string.substring(0,startIndex)
        + replacement
        + string.substring(endIndex);
  }
}