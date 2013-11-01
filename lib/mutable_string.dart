library mutable_string;

import 'dart:collection';

import 'package:multi_reg_exp/multi_reg_exp.dart';

part 'mutable_string_matches_iterable.dart';
part 'mutable_string_match.dart';

class MutableString implements StringContainer{
  String string;
  
  MutableString(this.string);
  
  @override
  Iterable<MutableStringMatch> allMatches(RegExp regExp){
    return new MutableStringMatchesIterable(this,regExp);
  }

  @override
  Iterable<MutableStringMatch> allMatchesFromMultiRegExp(MultiRegExp multiRegExp){
    return new MutableStringMatchesIterable(this,multiRegExp);
  }
  
  substring(int startIndex, [int endIndex]) => this.string = this.string.substring(startIndex, endIndex);
  
  trim() => this.string = this.string.trim();
  
  replacePart(int startIndex, int endIndex, [String replacement = ''])
    => this.string = this.string.substring(0,startIndex) + replacement + this.string.substring(endIndex);
}