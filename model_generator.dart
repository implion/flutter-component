import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

const tag = '\$';
const src = './lib/json';
const dist = './lib/model/';

void walk() {

  var srcDir = Directory(src);
  var fileList = srcDir.listSync();
  var template = File('./template.dart').readAsStringSync();
  File file;
  for (var f in fileList) {
    if (FileSystemEntity.isFileSync(f.path)) {
      file = File(f.path);
      var paths = path.basename(f.path).split('.');
      String name = paths.first;
      if (name.startsWith('_')) return;
      var map = json.decode(file.readAsStringSync());
      // 避免导入重复的包使用Set
      var set = Set<String>();
      StringBuffer attr = StringBuffer();
      (map as Map<String, dynamic>).forEach((key, value) {
        if (key.startsWith('_')) return;
        attr.write(getType(value, set, name) + '?');
        attr.write(' ');
        attr.write(key);
        attr.write(';');
        attr.write('\r\n  ');
      });
      String className = name[0].toUpperCase() + name.substring(1);
      var formatString = format(template, [name, className, className, attr.toString(), className, className, className]);
      var _import = set.join(';\r\n');
      _import = _import.isEmpty ? '' : ';';
      formatString = formatString.replaceFirst('%t', _import);
      File('$dist$name.dart').writeAsStringSync(formatString);
    }
  }
}

String changeFirstChar(String str, [bool upper = true]) {
  return (upper ? str[0].toUpperCase() : str[0].toLowerCase()) + str.substring(1);
}

String getType(v, Set<String> set, String current) {
  current = current.toLowerCase();
  var verifyList = [v is bool, v is num, v is Map, v is List, v is String];
  var types = ['bool', 'num', 'Map<String, dynamic>', 'List', 'String'];
  var index = verifyList.indexWhere((element) => element);
  if (index < 0 || index >= types.length) return 'String';
  if (index == verifyList.length - 1) {
    // 如果是字符串类型
    v = v as String;
    if (v.startsWith('$tag[]')) {
      var className = changeFirstChar(v.substring(3), false);
      if (className.toLowerCase() != current) {
        set.add('import $className.dart');
      }
      return 'List<${changeFirstChar(className)}>';
    } else if (v.startsWith(tag)) {
      var fileName = changeFirstChar(v.substring(1), false);
      if (fileName.toLowerCase() != current) {
        set.add('import $fileName.dart');
      }
      return changeFirstChar(fileName);
    }
    return 'String';
  } else {
    return types[index];
  }
}

String format(String fmt, List<Object> params) {
  int matchIndex = 0;
  String replace(Match m) {
    if (matchIndex < params.length) {
      switch (m[0]) {
        case '%s':
          return params[matchIndex++].toString();
      }
    } else {
      throw Exception('Missing parameter for string format');
    }
    throw Exception("Invalid format string: " + m[0].toString());
  }
  return fmt.replaceAllMapped("%s", replace);;
}

void main() {
  walk();
}