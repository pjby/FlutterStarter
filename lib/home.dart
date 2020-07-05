import 'package:flutter/material.dart';
import 'package:playlistapp/NewSong.dart';
import 'package:playlistapp/models.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Song> songs = List<Song>.generate(
      150,
      (i) => Song(
            albumName: 'Album $i',
            songName: 'Song $i',
            artistName: 'Artist $i',
            lengthInSec: i,
            url: 'https://$i/',
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Text(
                "Haoye's Playlist",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    child: Dismissible(
                      onDismissed: (direction){
                        Song song = songs[index];
                        setState(() {
                          songs.removeAt(index);
                        });
                        Scaffold.of(context).hideCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Deleted ${songs[index].songName} from the list'
                          ),
                          action: SnackBarAction(
                            textColor: Colors.blue,
                            onPressed: (){
                              songs.insert(index, song);
                            },
                            label: 'UNDO',
                          ),
                        ));
                      },
                      background: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 4,
                        ),
                        color: Colors.red,
                      ),
                      key: Key(songs[index].toString()),
                      child: Card(
                        child: ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.music_note,
                              ),
                              Text(songs[index].lengthInSec.toString()),
                            ],
                          ),
                          title: Text(songs[index].songName),
                          subtitle: Text(songs[index].artistName),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                          ),
                        ),
                      ),
                    )
                  );
                },
                itemCount: songs.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewSong())),
      ),
    );
  }

  //void addSong() {}
}
