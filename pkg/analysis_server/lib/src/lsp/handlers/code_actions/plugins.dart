// Copyright (c) 2022, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:analysis_server/lsp_protocol/protocol.dart';
import 'package:analysis_server/src/lsp/handlers/code_actions/abstract_code_actions_producer.dart';
import 'package:analysis_server/src/lsp/mapping.dart';
import 'package:analyzer/src/dart/analysis/driver.dart';
import 'package:analyzer/src/util/performance/operation_performance.dart';
import 'package:analyzer_plugin/protocol/protocol.dart' as plugin;
import 'package:analyzer_plugin/protocol/protocol_generated.dart' as plugin;
import 'package:analyzer_plugin/src/protocol/protocol_internal.dart' as plugin;
import 'package:collection/collection.dart';

/// Produces [CodeAction]s from Plugin fixes and assists.
class PluginCodeActionsProducer extends AbstractCodeActionsProducer {
  final AnalysisDriver? driver;

  PluginCodeActionsProducer(
    super.server,
    super.file,
    super.lineInfo, {
    required super.offset,
    required super.length,
    required super.shouldIncludeKind,
    required super.capabilities,
    required super.analysisOptions,
  }) : driver = server.getAnalysisDriver(file.path);

  @override
  String get name => 'PluginActionsComputer';

  @override
  Future<List<CodeActionWithPriority>> getAssistActions({
    OperationPerformance? performance,
  }) async {
    // These assists are only provided as literal CodeActions.
    if (!supportsLiterals) {
      return [];
    }

    var requestParams = plugin.EditGetAssistsParams(path, offset, length);
    var responses = await _sendPluginRequest(requestParams);

    return responses
        .map((response) => plugin.EditGetAssistsResult.fromResponse(response))
        .expand((response) => response.assists)
        .map(_convertAssist)
        .toList();
  }

  @override
  Future<List<CodeActionWithPriority>> getFixActions(
    OperationPerformance? performance,
  ) async {
    // These fixes are only provided as literal CodeActions.
    if (!supportsLiterals) {
      return [];
    }

    var requestParams = plugin.EditGetFixesParams(path, offset);
    var responses = await _sendPluginRequest(requestParams);

    return responses
        .map((response) => plugin.EditGetFixesResult.fromResponse(response))
        .expand((response) => response.fixes)
        .map(_convertFixes)
        .flattenedToList;
  }

  @override
  Future<List<Either2<CodeAction, Command>>> getRefactorActions() async => [];

  @override
  Future<List<Either2<CodeAction, Command>>> getSourceActions() async => [];

  CodeActionWithPriority _convertAssist(plugin.PrioritizedSourceChange assist) {
    return (
      action: createAssistAction(
        assist.change,
        'assist from plugin',
        path,
        lineInfo,
      ),
      priority: assist.priority,
    );
  }

  Iterable<CodeActionWithPriority> _convertFixes(
    plugin.AnalysisErrorFixes fixes,
  ) {
    var diagnostic = pluginToDiagnostic(
      server.uriConverter,
      (_) => lineInfo,
      fixes.error,
      supportedTags: supportedDiagnosticTags,
      clientSupportsCodeDescription: supportsCodeDescription,
    );
    return fixes.fixes.map(
      (fix) => (
        action: createFixAction(
          fix.change,
          'fix from plugin',
          diagnostic,
          path,
          lineInfo,
        ),
        priority: fix.priority,
      ),
    );
  }

  Future<List<plugin.Response>> _sendPluginRequest(
    plugin.RequestParams requestParams,
  ) async {
    var driver = this.driver;
    if (driver == null) {
      return [];
    }

    var pluginFutures = server.broadcastRequestToPlugins(requestParams, driver);

    return waitForResponses(pluginFutures, requestParameters: requestParams);
  }
}
