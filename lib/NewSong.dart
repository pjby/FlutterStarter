import 'package:flutter/material.dart';

class NewSong extends StatefulWidget {
  @override
  _NewSongState createState() => _NewSongState();
}

class _NewSongState extends State<NewSong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Song'),
      ),
    );
  }
}
