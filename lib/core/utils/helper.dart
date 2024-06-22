class Helper {
  static List<String> findAndSplitSuperscript(String text) {
    List<String> parts = [];
    RegExp regex = RegExp(r'(\d+)\)');
    Iterable<RegExpMatch> matches = regex.allMatches(text);

    int start = 0;
    for (RegExpMatch match in matches) {
      if (match.start > start) {
        parts.add(text.substring(start, match.start));
      }
      parts.add(text.substring(match.start, match.end));
      start = match.end;
    }
    if (start < text.length) {
      parts.add(text.substring(start));
    }

    return parts;
  }

  static bool isSuperscript(String text) {
    RegExp regex = RegExp(r'(\d+)\)');
    return regex.hasMatch(text);
  }
}
