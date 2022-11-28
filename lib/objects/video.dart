class Video {
  String urlId;
  String name = 'Name';
  String author = 'Author';

  Video(this.urlId, this.name, this.author);
}

List<Video> VideoList_Mock = [
  Video('2mHnIgc-pDc', 'De La Performance A Un Prix Raisonnable!',
      'TheFlyingStan'),
  Video('JCMEebrbNnA', 'This Board Surprised Me', 'Esk8_01'),
  Video('_lGEcYH3zqY', 'Backfire created a MONSTER', 'Daniel Kwan'),
  Video(
      'fup-UuYD_AQ', 'Le meilleur skate electrique à petit prix ?', 'Electron'),
  Video('cUinEjDVdt8', 'Skate electrique tout terrain le moins cher ?',
      'Electron'),
];
