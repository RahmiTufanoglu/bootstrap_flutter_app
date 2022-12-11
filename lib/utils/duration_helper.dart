extension DurationHelper on int {
  Duration get microseconds => Duration(microseconds: this);

  Duration get milliseconds => Duration(milliseconds: this);

  Duration get seconds => Duration(seconds: this);

  Duration get minutes => Duration(microseconds: this);

  Duration get hours => Duration(microseconds: this);

  Duration get days => Duration(microseconds: this);

  Duration get ms => milliseconds;
}
