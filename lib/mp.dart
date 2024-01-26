// Caller page
import 'package:flutter/material.dart';

class CallerPage extends StatefulWidget {
  @override
  _CallerPageState createState() => _CallerPageState();
}

class _CallerPageState extends State<CallerPage> {
  String input = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caller Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Input: $input"),
            ElevatedButton(
              onPressed: () async {
                // Open a new screen to get input and return to the caller page
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputPage(),
                  ),
                );
                // Update the input with the result
                setState(() {
                  input = result;
                });
              },
              child: Text("Get Input"),
            ),
          ],
        ),
      ),
    );
  }
}

// Input page
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter something",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Return to the caller page with the input
                Navigator.pop(context, _controller.text);
              },
              child: Text("Return"),
            ),
          ],
        ),
      ),
    );
  }
}
