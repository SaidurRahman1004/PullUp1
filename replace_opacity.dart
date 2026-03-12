import 'dart:io';

void main() {
  final dir = Directory('lib');
  final files = dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'));

  final regex = RegExp(r'\.withOpacity\(([\d\.]+)\)');
  int count = 0;
  for (var file in files) {
    var content = file.readAsStringSync();
    if (content.contains(regex)) {
      content = content.replaceAllMapped(regex, (match) {
        double opacity = double.parse(match.group(1)!);
        int alpha = (opacity * 255).round();
        return '.withAlpha($alpha)';
      });
      file.writeAsStringSync(content);
      count++;
    }
  }
  // ignore: avoid_print
  print('Total files updated: $count');
}
