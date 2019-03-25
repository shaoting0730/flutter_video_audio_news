class AudioListmodel {
  List<SongList> songList;
  Billboard billboard;
  int errorCode;

  AudioListmodel({this.songList, this.billboard, this.errorCode});

  AudioListmodel.fromJson(Map<String, dynamic> json) {
    if (json['song_list'] != null) {
      songList = new List<SongList>();
      json['song_list'].forEach((v) {
        songList.add(new SongList.fromJson(v));
      });
    }
    billboard = json['billboard'] != null
        ? new Billboard.fromJson(json['billboard'])
        : null;
    errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.songList != null) {
      data['song_list'] = this.songList.map((v) => v.toJson()).toList();
    }
    if (this.billboard != null) {
      data['billboard'] = this.billboard.toJson();
    }
    data['error_code'] = this.errorCode;
    return data;
  }
}

class SongList {
  String artistId;
  String language;
  String picBig;
  String picSmall;
  String country;
  String area;
  String publishtime;
  String albumNo;
  String lrclink;
  String copyType;
  String hot;
  String allArtistTingUid;
  String resourceType;
  String isNew;
  String rankChange;
  String rank;
  String allArtistId;
  String style;
  String delStatus;
  String relateStatus;
  String toneid;
  String allRate;
  int fileDuration;
  int hasMvMobile;
  String versions;
  String bitrateFee;
  String biaoshi;
  String info;
  String hasFilmtv;
  String siProxycompany;
  String resEncryptionFlag;
  String songId;
  String title;
  String tingUid;
  String author;
  String albumId;
  String albumTitle;
  int isFirstPublish;
  int havehigh;
  int charge;
  int hasMv;
  int learn;
  String songSource;
  String piaoId;
  String koreanBbSong;
  String resourceTypeExt;
  String mvProvider;
  String artistName;
  String picRadio;
  String picS500;
  String picPremium;
  String picHuge;
  String album500500;
  String album800800;
  String album10001000;

  SongList(
      {this.artistId,
      this.language,
      this.picBig,
      this.picSmall,
      this.country,
      this.area,
      this.publishtime,
      this.albumNo,
      this.lrclink,
      this.copyType,
      this.hot,
      this.allArtistTingUid,
      this.resourceType,
      this.isNew,
      this.rankChange,
      this.rank,
      this.allArtistId,
      this.style,
      this.delStatus,
      this.relateStatus,
      this.toneid,
      this.allRate,
      this.fileDuration,
      this.hasMvMobile,
      this.versions,
      this.bitrateFee,
      this.biaoshi,
      this.info,
      this.hasFilmtv,
      this.siProxycompany,
      this.resEncryptionFlag,
      this.songId,
      this.title,
      this.tingUid,
      this.author,
      this.albumId,
      this.albumTitle,
      this.isFirstPublish,
      this.havehigh,
      this.charge,
      this.hasMv,
      this.learn,
      this.songSource,
      this.piaoId,
      this.koreanBbSong,
      this.resourceTypeExt,
      this.mvProvider,
      this.artistName,
      this.picRadio,
      this.picS500,
      this.picPremium,
      this.picHuge,
      this.album500500,
      this.album800800,
      this.album10001000});

  SongList.fromJson(Map<String, dynamic> json) {
    artistId = json['artist_id'];
    language = json['language'];
    picBig = json['pic_big'];
    picSmall = json['pic_small'];
    country = json['country'];
    area = json['area'];
    publishtime = json['publishtime'];
    albumNo = json['album_no'];
    lrclink = json['lrclink'];
    copyType = json['copy_type'];
    hot = json['hot'];
    allArtistTingUid = json['all_artist_ting_uid'];
    resourceType = json['resource_type'];
    isNew = json['is_new'];
    rankChange = json['rank_change'];
    rank = json['rank'];
    allArtistId = json['all_artist_id'];
    style = json['style'];
    delStatus = json['del_status'];
    relateStatus = json['relate_status'];
    toneid = json['toneid'];
    allRate = json['all_rate'];
    fileDuration = json['file_duration'];
    hasMvMobile = json['has_mv_mobile'];
    versions = json['versions'];
    bitrateFee = json['bitrate_fee'];
    biaoshi = json['biaoshi'];
    info = json['info'];
    hasFilmtv = json['has_filmtv'];
    siProxycompany = json['si_proxycompany'];
    resEncryptionFlag = json['res_encryption_flag'];
    songId = json['song_id'];
    title = json['title'];
    tingUid = json['ting_uid'];
    author = json['author'];
    albumId = json['album_id'];
    albumTitle = json['album_title'];
    isFirstPublish = json['is_first_publish'];
    havehigh = json['havehigh'];
    charge = json['charge'];
    hasMv = json['has_mv'];
    learn = json['learn'];
    songSource = json['song_source'];
    piaoId = json['piao_id'];
    koreanBbSong = json['korean_bb_song'];
    resourceTypeExt = json['resource_type_ext'];
    mvProvider = json['mv_provider'];
    artistName = json['artist_name'];
    picRadio = json['pic_radio'];
    picS500 = json['pic_s500'];
    picPremium = json['pic_premium'];
    picHuge = json['pic_huge'];
    album500500 = json['album_500_500'];
    album800800 = json['album_800_800'];
    album10001000 = json['album_1000_1000'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artist_id'] = this.artistId;
    data['language'] = this.language;
    data['pic_big'] = this.picBig;
    data['pic_small'] = this.picSmall;
    data['country'] = this.country;
    data['area'] = this.area;
    data['publishtime'] = this.publishtime;
    data['album_no'] = this.albumNo;
    data['lrclink'] = this.lrclink;
    data['copy_type'] = this.copyType;
    data['hot'] = this.hot;
    data['all_artist_ting_uid'] = this.allArtistTingUid;
    data['resource_type'] = this.resourceType;
    data['is_new'] = this.isNew;
    data['rank_change'] = this.rankChange;
    data['rank'] = this.rank;
    data['all_artist_id'] = this.allArtistId;
    data['style'] = this.style;
    data['del_status'] = this.delStatus;
    data['relate_status'] = this.relateStatus;
    data['toneid'] = this.toneid;
    data['all_rate'] = this.allRate;
    data['file_duration'] = this.fileDuration;
    data['has_mv_mobile'] = this.hasMvMobile;
    data['versions'] = this.versions;
    data['bitrate_fee'] = this.bitrateFee;
    data['biaoshi'] = this.biaoshi;
    data['info'] = this.info;
    data['has_filmtv'] = this.hasFilmtv;
    data['si_proxycompany'] = this.siProxycompany;
    data['res_encryption_flag'] = this.resEncryptionFlag;
    data['song_id'] = this.songId;
    data['title'] = this.title;
    data['ting_uid'] = this.tingUid;
    data['author'] = this.author;
    data['album_id'] = this.albumId;
    data['album_title'] = this.albumTitle;
    data['is_first_publish'] = this.isFirstPublish;
    data['havehigh'] = this.havehigh;
    data['charge'] = this.charge;
    data['has_mv'] = this.hasMv;
    data['learn'] = this.learn;
    data['song_source'] = this.songSource;
    data['piao_id'] = this.piaoId;
    data['korean_bb_song'] = this.koreanBbSong;
    data['resource_type_ext'] = this.resourceTypeExt;
    data['mv_provider'] = this.mvProvider;
    data['artist_name'] = this.artistName;
    data['pic_radio'] = this.picRadio;
    data['pic_s500'] = this.picS500;
    data['pic_premium'] = this.picPremium;
    data['pic_huge'] = this.picHuge;
    data['album_500_500'] = this.album500500;
    data['album_800_800'] = this.album800800;
    data['album_1000_1000'] = this.album10001000;
    return data;
  }
}

class Billboard {
  String billboardType;
  String billboardNo;
  String updateDate;
  String billboardSongnum;
  int havemore;
  String name;
  String comment;
  String picS192;
  String picS640;
  String picS444;
  String picS260;
  String picS210;
  String webUrl;
  String color;
  String bgColor;
  String bgPic;

  Billboard(
      {this.billboardType,
      this.billboardNo,
      this.updateDate,
      this.billboardSongnum,
      this.havemore,
      this.name,
      this.comment,
      this.picS192,
      this.picS640,
      this.picS444,
      this.picS260,
      this.picS210,
      this.webUrl,
      this.color,
      this.bgColor,
      this.bgPic});

  Billboard.fromJson(Map<String, dynamic> json) {
    billboardType = json['billboard_type'];
    billboardNo = json['billboard_no'];
    updateDate = json['update_date'];
    billboardSongnum = json['billboard_songnum'];
    havemore = json['havemore'];
    name = json['name'];
    comment = json['comment'];
    picS192 = json['pic_s192'];
    picS640 = json['pic_s640'];
    picS444 = json['pic_s444'];
    picS260 = json['pic_s260'];
    picS210 = json['pic_s210'];
    webUrl = json['web_url'];
    color = json['color'];
    bgColor = json['bg_color'];
    bgPic = json['bg_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billboard_type'] = this.billboardType;
    data['billboard_no'] = this.billboardNo;
    data['update_date'] = this.updateDate;
    data['billboard_songnum'] = this.billboardSongnum;
    data['havemore'] = this.havemore;
    data['name'] = this.name;
    data['comment'] = this.comment;
    data['pic_s192'] = this.picS192;
    data['pic_s640'] = this.picS640;
    data['pic_s444'] = this.picS444;
    data['pic_s260'] = this.picS260;
    data['pic_s210'] = this.picS210;
    data['web_url'] = this.webUrl;
    data['color'] = this.color;
    data['bg_color'] = this.bgColor;
    data['bg_pic'] = this.bgPic;
    return data;
  }
}