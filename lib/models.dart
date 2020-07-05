class Song {
  String songName;
  String albumName;
  String artistName;
  int lengthInSec;
  String url;

  Song({this.songName, this.albumName, this.artistName, this.lengthInSec, this.url});

  @override
  String toString() {
    return '$songName,$albumName,$artistName';
  }
}