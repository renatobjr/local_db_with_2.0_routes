class Game {
  int? idGame;
  String? title, plataform;

  Game({this.idGame, this.title, this.plataform});

  factory Game.fromMap(Map<dynamic, dynamic> data) {
    return Game(
      idGame: data['idGame'],
      title: data['title'],
      plataform: data['plataform'],
    );
  }

  Map<String, dynamic> toMap() => {
        'idGame': idGame,
        'title': title,
        'plataform': plataform,
      };
}
