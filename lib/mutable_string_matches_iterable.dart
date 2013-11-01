part of mutable_string;

class MutableStringMatchesIterable extends IterableBase<MutableStringMatch> implements Iterator<MutableStringMatch>{
  final MutableString mutableString;
  final RegExp regExp;
  MutableStringMatch _current;
  int lastIndex = 0;
  
  MutableStringMatchesIterable(MutableString this.mutableString,RegExp this.regExp){
  }

  Iterator<MutableStringMatch> get iterator => this;
  

  /**
   * Moves to the next element. Returns true if [current] contains the next
   * element. Returns false, if no element was left.
   *
   * It is safe to invoke [moveNext] even when the iterator is already
   * positioned after the last element. In this case [moveNext] has no effect.
   */
  bool moveNext(){
    if(this.mutableString.string.length < this.lastIndex) return false; //TODO <= ?
    Match match = this.regExp.firstMatch(this.mutableString.string.substring(this.lastIndex));
    if(match == null) return false;
    this._current = new MutableStringMatch(this,match,match.start + this.lastIndex, match.end + this.lastIndex, this.mutableString.string);
    this.lastIndex += match.end;
    return true;
  }

  /**
   * Returns the current element.
   *
   * Return [:null:] if the iterator has not yet been moved to the first
   * element, or if the iterator has been moved after the last element of the
   * [Iterable].
   */
  MutableStringMatch get current{
    return this._current;
  }
  
}
