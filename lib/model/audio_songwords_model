class AudioSongWordsModel {
  String title;
  String lrcContent;

  AudioSongWordsModel({this.title, this.lrcContent});

  AudioSongWordsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    lrcContent = json['lrcContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['lrcContent'] = this.lrcContent;
    return data;
  }
}
