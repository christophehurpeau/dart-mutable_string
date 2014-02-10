part of mutable_string;

class MutableStringMatch extends Match {
  final MutableStringMatchesIterable _iterator;
  final Match _match;
  final int start;
  final int end;
  final String input;

  MutableStringMatch(this._iterator, this._match, this.start, this.end, this.input);

  @override
  String group(int group) => _match.group(group);

  @override
  String operator [](int group) => _match.group(group);

  @override
  List<String> groups(List<int> groupIndices) => _match.groups(groupIndices);

  @override
  int get groupCount => _match.groupCount;

  @override
  Pattern get pattern => _match.pattern;

  /// Set the iterator's last index
  set lastIndex(int index) => _iterator.lastIndex = index;

  /// Get the iterator's last index
  int get lastIndex => _iterator.lastIndex;

  void replacePart(int startIndex, int endIndex, [String replacement = '']){
    _iterator.mutableString.replacePart(startIndex, endIndex, replacement);
    if (startIndex < this._iterator.lastIndex) { //TODO <= ?
      _iterator.lastIndex = _iterator.lastIndex - (endIndex - startIndex) + replacement.length;
    }
  }
}