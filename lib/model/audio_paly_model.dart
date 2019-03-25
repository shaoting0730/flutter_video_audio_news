class AudioPlayModel {
  Songinfo songinfo;
  int errorCode;
  Bitrate bitrate;

  AudioPlayModel({this.songinfo, this.errorCode, this.bitrate});

  AudioPlayModel.fromJson(Map<String, dynamic> json) {
    songinfo = json['songinfo'] != null
        ? new Songinfo.fromJson(json['songinfo'])
        : null;
    errorCode = json['error_code'];
    bitrate =
        json['bitrate'] != null ? new Bitrate.fromJson(json['bitrate']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.songinfo != null) {
      data['songinfo'] = this.songinfo.toJson();
    }
    data['error_code'] = this.errorCode;
    if (this.bitrate != null) {
      data['bitrate'] = this.bitrate.toJson();
    }
    return data;
  }
}

class Songinfo {
  int specialType;
  String picHuge;
  String tingUid;
  String picPremium;
  int havehigh;
  String siProxycompany;
  String author;
  String toneid;
  int hasMv;
  String songId;
  String title;
  String artistId;
  String lrclink;
  String relateStatus;
  int learn;
  String picBig;
  int playType;
  String albumId;
  String picRadio;
  String bitrateFee;
  String songSource;
  String allArtistId;
  String allArtistTingUid;
  String piaoId;
  int charge;
  String copyType;
  String allRate;
  String koreanBbSong;
  int isFirstPublish;
  int hasMvMobile;
  String albumTitle;
  String picSmall;
  String albumNo;
  String resourceTypeExt;
  String resourceType;

  Songinfo(
      {this.specialType,
      this.picHuge,
      this.tingUid,
      this.picPremium,
      this.havehigh,
      this.siProxycompany,
      this.author,
      this.toneid,
      this.hasMv,
      this.songId,
      this.title,
      this.artistId,
      this.lrclink,
      this.relateStatus,
      this.learn,
      this.picBig,
      this.playType,
      this.albumId,
      this.picRadio,
      this.bitrateFee,
      this.songSource,
      this.allArtistId,
      this.allArtistTingUid,
      this.piaoId,
      this.charge,
      this.copyType,
      this.allRate,
      this.koreanBbSong,
      this.isFirstPublish,
      this.hasMvMobile,
      this.albumTitle,
      this.picSmall,
      this.albumNo,
      this.resourceTypeExt,
      this.resourceType});

  Songinfo.fromJson(Map<String, dynamic> json) {
    specialType = json['special_type'];
    picHuge = json['pic_huge'];
    tingUid = json['ting_uid'];
    picPremium = json['pic_premium'];
    havehigh = json['havehigh'];
    siProxycompany = json['si_proxycompany'];
    author = json['author'];
    toneid = json['toneid'];
    hasMv = json['has_mv'];
    songId = json['song_id'];
    title = json['title'];
    artistId = json['artist_id'];
    lrclink = json['lrclink'];
    relateStatus = json['relate_status'];
    learn = json['learn'];
    picBig = json['pic_big'];
    playType = json['play_type'];
    albumId = json['album_id'];
    picRadio = json['pic_radio'];
    bitrateFee = json['bitrate_fee'];
    songSource = json['song_source'];
    allArtistId = json['all_artist_id'];
    allArtistTingUid = json['all_artist_ting_uid'];
    piaoId = json['piao_id'];
    charge = json['charge'];
    copyType = json['copy_type'];
    allRate = json['all_rate'];
    koreanBbSong = json['korean_bb_song'];
    isFirstPublish = json['is_first_publish'];
    hasMvMobile = json['has_mv_mobile'];
    albumTitle = json['album_title'];
    picSmall = json['pic_small'];
    albumNo = json['album_no'];
    resourceTypeExt = json['resource_type_ext'];
    resourceType = json['resource_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['special_type'] = this.specialType;
    data['pic_huge'] = this.picHuge;
    data['ting_uid'] = this.tingUid;
    data['pic_premium'] = this.picPremium;
    data['havehigh'] = this.havehigh;
    data['si_proxycompany'] = this.siProxycompany;
    data['author'] = this.author;
    data['toneid'] = this.toneid;
    data['has_mv'] = this.hasMv;
    data['song_id'] = this.songId;
    data['title'] = this.title;
    data['artist_id'] = this.artistId;
    data['lrclink'] = this.lrclink;
    data['relate_status'] = this.relateStatus;
    data['learn'] = this.learn;
    data['pic_big'] = this.picBig;
    data['play_type'] = this.playType;
    data['album_id'] = this.albumId;
    data['pic_radio'] = this.picRadio;
    data['bitrate_fee'] = this.bitrateFee;
    data['song_source'] = this.songSource;
    data['all_artist_id'] = this.allArtistId;
    data['all_artist_ting_uid'] = this.allArtistTingUid;
    data['piao_id'] = this.piaoId;
    data['charge'] = this.charge;
    data['copy_type'] = this.copyType;
    data['all_rate'] = this.allRate;
    data['korean_bb_song'] = this.koreanBbSong;
    data['is_first_publish'] = this.isFirstPublish;
    data['has_mv_mobile'] = this.hasMvMobile;
    data['album_title'] = this.albumTitle;
    data['pic_small'] = this.picSmall;
    data['album_no'] = this.albumNo;
    data['resource_type_ext'] = this.resourceTypeExt;
    data['resource_type'] = this.resourceType;
    return data;
  }
}

class Bitrate {
  String showLink;
  int free;
  int songFileId;
  int fileSize;
  String fileExtension;
  int fileDuration;
  int fileBitrate;
  String fileLink;
  String hash;

  Bitrate(
      {this.showLink,
      this.free,
      this.songFileId,
      this.fileSize,
      this.fileExtension,
      this.fileDuration,
      this.fileBitrate,
      this.fileLink,
      this.hash});

  Bitrate.fromJson(Map<String, dynamic> json) {
    showLink = json['show_link'];
    free = json['free'];
    songFileId = json['song_file_id'];
    fileSize = json['file_size'];
    fileExtension = json['file_extension'];
    fileDuration = json['file_duration'];
    fileBitrate = json['file_bitrate'];
    fileLink = json['file_link'];
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show_link'] = this.showLink;
    data['free'] = this.free;
    data['song_file_id'] = this.songFileId;
    data['file_size'] = this.fileSize;
    data['file_extension'] = this.fileExtension;
    data['file_duration'] = this.fileDuration;
    data['file_bitrate'] = this.fileBitrate;
    data['file_link'] = this.fileLink;
    data['hash'] = this.hash;
    return data;
  }
}