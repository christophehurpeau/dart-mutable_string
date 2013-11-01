part of mutable_string;

class MutableStringMatch extends Match{
  final MutableStringMatchesIterable _iterator;
  final Match _match;
  final int start;
  final int end;
  final String input;
  
  MutableStringMatch(MutableStringMatchesIterable this._iterator,Match this._match,int this.start,int this.end, String this.input);
  
  /**
   * Returns the string matched by the given [group].
   *
   * If [group] is 0, returns the match of the pattern.
   *
   * The result may be `null` if the pattern didn't assign a value to it
   * as part of this match.
   */
  String group(int group) => this._match.group(group);

  /**
   * Returns the string matched by the given [group].
   *
   * If [group] is 0, returns the match of the pattern.
   *
   * Short alias for [Match.group].
   */
  String operator [](int group) => this._match.group(group);

  /**
   * Returns a list of the groups with the given indices.
   *
   * The list contains the strings returned by [group] for each index in
   * [groupIndices].
   */
  List<String> groups(List<int> groupIndices) => this._match.groups(groupIndices);

  /**
   * Returns the number of captured groups in the match.
   *
   * Some patterns may capture parts of the input that was used to
   * compute the full match. This is the number of captured groups,
   * which is also the maximal allowed argument to the [group] method.
   */
  int get groupCount => this._match.groupCount;

  /**
   * The pattern used to search in [input].
   */
  Pattern get pattern => this._match.pattern;
  

  /**
   * Deprecated alias for [input].
   *
   * Will be removed soon.
   */
  @deprecated
  String get str => this.input;
  
  set lastIndex(int index) => this._iterator.lastIndex = index;
  
  int get lastIndex => this._iterator.lastIndex;


  void replacePart(int startIndex, int endIndex, [String replacement = '']){
    this._iterator.mutableString.replacePart(startIndex, endIndex, replacement);
    if(startIndex < this._iterator.lastIndex) //TODO <= ?
      this._iterator.lastIndex = this._iterator.lastIndex - (endIndex - startIndex) + replacement.length;
  }
}