part of mutable_string;

class MutableStringMatchesIterable extends IterableBase<MutableStringMatch>
                                      implements Iterator<MutableStringMatch> {
  final MutableString mutableString;
  final RegExp regExp;
  MutableStringMatch _current;
  int lastIndex = 0;

  MutableStringMatchesIterable(MutableString this.mutableString, RegExp this.regExp);

  Iterator<MutableStringMatch> get iterator => this;

  @override
  bool moveNext() {
    if (mutableString.string.length < this.lastIndex) {
      return false; //TODO <= ?
    }
    Match match = regExp.firstMatch(mutableString.string.substring(lastIndex));
    if (match == null) {
      return false;
    }
    _current = new MutableStringMatch(this, match, match.start + lastIndex,
        match.end + lastIndex, mutableString.string);
    lastIndex += match.end;
    return true;
  }

  @override
  MutableStringMatch get current => _current;

}
