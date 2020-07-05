import 'package:flutter/material.dart';
import 'package:playlistapp/models.dart';

class NewSong extends StatefulWidget {
  @override
  _NewSongState createState() => _NewSongState();
}

class _NewSongState extends State<NewSong> {
  final _songTitleController = TextEditingController();
  final _albumTitleController = TextEditingController();
  final _artistNameController = TextEditingController();
  final _lengthController = TextEditingController();
  final _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Song'),
      ),
      body: Form(
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 25,
              bottom: 25,
            ),
            child: TextFormField(
              validator: (name) {
                if (name.isEmpty)
                  return 'Song name cannot be empty';
                else
                  return null;
              },
              controller: _songTitleController,
              style: Theme.of(context).textTheme.subtitle1,
              decoration: InputDecoration(
                labelText: 'Song Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 25,
            ),
            child: TextFormField(
              validator: (name) {
                if (name.isEmpty)
                  return 'Album name cannot be empty';
                else
                  return null;
              },
              controller: _albumTitleController,
              style: Theme.of(context).textTheme.subtitle1,
              decoration: InputDecoration(
                labelText: 'Album Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 25,
            ),
            child: TextFormField(
              validator: (name) {
                if (name.isEmpty)
                  return 'Artist name cannot be empty';
                else
                  return null;
              },
              controller: _artistNameController,
              style: Theme.of(context).textTheme.subtitle1,
              decoration: InputDecoration(
                labelText: 'Artist Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 25,
            ),
            child: TextFormField(
              validator: (length) {
                if (length.isEmpty)
                  return 'Length cannot be empty';
                else
                  return null;
              },
              controller: _lengthController,
              style: Theme.of(context).textTheme.subtitle1,
              decoration: InputDecoration(
                labelText: 'Length In Seconds',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 25,
            ),
            child: TextFormField(
              validator: (url) {
                if (url.isEmpty)
                  return 'URL name cannot be empty';
                else
                  return null;
              },
              controller: _urlController,
              style: Theme.of(context).textTheme.subtitle1,
              decoration: InputDecoration(
                labelText: 'URL',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
          Padding(
            child: RaisedButton(
              padding: EdgeInsets.all(0),
              onPressed: (){
                Song song = new Song(
                  songName: _songTitleController.text,
                  albumName: _albumTitleController.text,
                  artistName: _artistNameController.text,
                  lengthInSec: int.parse(_lengthController.text),
                  url: _urlController.text,
                );
                Navigator.pop(context, song);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              splashColor: Colors.white,
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.lightBlueAccent,
                        Theme.of(context).primaryColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0,
                        1,
                      ],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Container(
                  height: 67,
                  alignment: Alignment.center,
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 10,
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _songTitleController.dispose();
    _albumTitleController.dispose();
    _artistNameController.dispose();
    _lengthController.dispose();
    _urlController.dispose();
  }
}
