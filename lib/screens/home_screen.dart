import 'package:flutter/material.dart';

import '../services/counter_stream_service.dart';

class HomeScreen extends StatelessWidget {
  final CounterStreamService _service = CounterStreamService();
  HomeScreen({super.key}) {
    _service.startCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live Counter Stream')),
      body: Center(
        child: StreamBuilder<int>(
          stream: _service.counterStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Text('co loi xay ra');
            }
            if (!snapshot.hasData) {
              return Text('chua co du lieu ');
            }
            return Text(
              'Counter: ${snapshot.data}',
              style: TextStyle(fontSize: 32),
            );
          },
        ),
      ),
    );
  }
}
