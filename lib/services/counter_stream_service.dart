import 'dart:async';

class CounterStreamService {
  final StreamController<int> _controller = StreamController<int>.broadcast();
  int _counter = 0;

  Stream<int> get counterStream => _controller.stream;
  int _count = 0;
  Timer? _timer;

  void startCounter() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _counter++;
      _controller.add(_counter);
    });
  }

  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}
