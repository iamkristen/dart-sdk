// Copyright (c) 2014, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analysis_server/src/channel/byte_stream_channel.dart';
import 'package:analysis_server/src/socket_server.dart';

/// Instances of the class [StdioAnalysisServer] implement a simple server
/// operating over standard input and output. The primary responsibility of this
/// server is to split incoming messages on newlines and pass them along to the
/// analysis server.
class StdioAnalysisServer {
  /// An object that can handle either a WebSocket connection or a connection
  /// to the client over stdio.
  SocketServer socketServer;

  /// Initialize a newly created stdio server.
  StdioAnalysisServer(this.socketServer);

  /// Begin serving requests over stdio.
  ///
  /// Return a future that will be completed when stdin closes.
  Future<void> serveStdio() {
    var serverChannel = StdinStdoutLineStreamServerChannel(
      socketServer.instrumentationService,
      requestStatistics: socketServer.requestStatistics,
    );
    socketServer.createAnalysisServer(serverChannel);
    return serverChannel.closed;
  }
}
