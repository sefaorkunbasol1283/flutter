class Sure {
  String sureAd = "";
  String sureMeal = "";
  String sureDipnot = "";
  String sureIndigiYer = "";
  String sureAdiAciklama = "";
  int indirilmeSirasi = 0;
  int sureNo = 0;
  int ayetSayisi = 0;

  Sure(this.sureAd, this.sureIndigiYer, this.indirilmeSirasi, this.ayetSayisi);
  Sure.fromObject(Map<String, dynamic> map) {
    this.sureAd = map['sureAd'];
    this.sureIndigiYer = map['sureIndigiYer'];
    this.indirilmeSirasi = map['indirilmeSirasi'];
    this.ayetSayisi = map['ayetSayisi'];
  }
}
