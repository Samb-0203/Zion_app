// song.dart
class Song {
  final int songNo;
  final String song;
  final String title;
  final String priseWord;
  final String lyrics;

  Song({
    required this.songNo,
    required this.song,
    required this.title,
    this.priseWord = '', // Default to empty string if not provided
    this.lyrics = '',    // Default to empty string if not provided
  });

  // Factory constructor to create Song from JSON
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      songNo: json['songNo'] as int,
      song: json['song'] as String,
      title: json['title'] as String,
      priseWord: json['priseWord'] as String? ?? '',
      lyrics: json['lyrics'] as String? ?? '',
    );
  }

  // Convert Song to JSON for POST/PUT requests
  Map<String, dynamic> toJson() {
    return {
      'songNo': songNo,
      'song': song,
      'title': title,
      'priseWord': priseWord,
      'lyrics': lyrics,
    };
  }
}

// category.dart
class Category {
  final String category;
  final List<Song> songs;

  Category({
    required this.category,
    required this.songs,
  });

  // Factory constructor to create Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      category: json['category'] as String,
      songs: (json['songs'] as List<dynamic>)
          .map((songJson) => Song.fromJson(songJson as Map<String, dynamic>))
          .toList(),
    );
  }

  // Convert Category to JSON for POST requests
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'songs': songs.map((song) => song.toJson()).toList(),
    };
  }
}