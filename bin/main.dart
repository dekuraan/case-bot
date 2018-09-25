import 'package:dart_case_bot/commands/open.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx/commands.dart';
import 'dart:async';
import 'package:dart_case_bot/case.dart';
import 'package:dart_case_bot/config.dart' as config;

@Command(name: "single", aliases: ["agh", "agh"])
Future<void> single(CommandContext context) async {
  await context.reply(content: "WORKING");
}

main() async {
  Client bot = Client(config.token);
  CommandsFramework(config.prefix, bot)
    ..admins = [Snowflake("214621966475329537")]
    ..registerLibraryCommands();
}
