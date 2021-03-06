import 'package:json_to_model/json_to_model.dart';
import 'package:args/args.dart';

void main(List<String> arguments) {
  
  print('Guzram\'s JSON2Model');
  print('====================');
  var source = '';
  String? onlyFile;
  var output = '';
  var argParser = ArgParser();
  argParser
    ..addOption(
      'source',
      abbr: 's',
      defaultsTo: './jsons/',
      callback: (v) => source = v??source,
      help: 'Specify source directory',
    )
    ..addOption(
      'output',
      abbr: 'o',
      defaultsTo: './lib/models/',
      callback: (v) => output = v??output,
      help: 'Specify models directory',
    )
    ..addOption(
      'onlyFile',
      abbr: 'f',
      defaultsTo: null,
      callback: (v) => onlyFile = v,
      help: 'Specify file to read',
    )
    ..parse(arguments);
  var runner =
      JsonModelRunner(source: source, output: output, onlyFile: onlyFile);
  runner.setup();

  print('Start generating');
  if (runner.run()) {
    // cleanup on success
    print('Cleanup');
    runner.cleanup();
  }
}
