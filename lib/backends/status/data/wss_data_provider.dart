import 'package:fpdart/fpdart.dart';
import 'package:ibmq/utils/talker.dart';
import 'package:web_socket_client/web_socket_client.dart';

/// Data provider to interact with the IBM Quantum Websocket Server.
class WssDataProvider {
  final String _accessToken;

  WssDataProvider({required String accessToken}) : _accessToken = accessToken;

  /// Get backends status updates from the IBM Quantum Websocket Server.
  /// The updates are queue length updates for the backends.
  ///
  /// Returns a stream of updates.
  TaskEither<String, Stream> getBackendsStatusUpdates() =>
      TaskEither.tryCatch(() async {
        final socket = WebSocket(Uri(
          scheme: 'wss',
          host: 'wss.quantum.ibm.com',
          path: 'backends/statuses/v/2',
        ));
        await socket.connection.firstWhere((state) => state is Connected);

        // Send the access token to authenticate the user
        socket.send('{"type": "authentication", "data": "$_accessToken"}');
        return socket.messages;
      }, (error, stackTrace) {
        talker.handle(
            error, stackTrace, 'Failed to get user job state updates');
        return 'Failed to get user job state updates';
      });
}
