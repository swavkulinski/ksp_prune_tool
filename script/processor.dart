import 'dart:io';

class Processor {
  final List<String> dirs;
  Processor(this.dirs);

  void disable() {
    _process("sample", (String input) {
      final dir = Directory(input);
      dir
          .listSync(
            recursive: true,
            followLinks: false,
          )
          .where((event) => event.existsSync())
          .where((event) => event.uri.pathSegments.last.endsWith(".cfg"))
          .forEach((event) {
        print("disable: ${event.path} => __disabled__");
        event.rename("${event.path}.__disabled__");
      });
    });
  }

  void restore() {
    _process("sample", (String input) {
      final dir = Directory(input);
      dir
          .listSync(recursive: true, followLinks: false)
          .where((event) =>
              event.uri.pathSegments.last.endsWith(".cfg.__disabled__"))
          .forEach((event) {
        event.rename(event.path.split(".__disabled__").first);
        print("restore: ${event.path}");
      });
    });
  }

  void _process(String startDir, Function processor) {
    dirs.forEach((element) {
      processor("../$element");
    });
  }
}
