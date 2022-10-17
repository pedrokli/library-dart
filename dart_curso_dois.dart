void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e Amarela";
  String sabor = "Doce e citrica";
  int diasDesdeColheita = 25;
  bool isMadura = funcEstaMadura(diasDesdeColheita);

  Fruta fruta01 = Fruta(nome, peso, cor, sabor, diasDesdeColheita);

  Legumes mandioca1 = Legumes('Macaxeira', 1200.0, 'Marrom', true);
  Fruta banana1 = Fruta('Banana', 75, 'Amarela', 'Doce', 12);
  Nozes macadamia1 = Nozes('Macadamia', 2, 'Branco Amarelado', 'Doce', 20, 35);
  Citricas limao1 = Citricas("Limão", 100, 'verde', 'Azedo', 5, 9);

  macadamia1.printAlimento();
  banana1.printAlimento();
  mandioca1.printAlimento();
  limao1.printAlimento();

  mandioca1.cozinhar();
  limao1.fazerSuco();

  banana1.separarIngredientes();
  macadamia1.fazerMassa();

  banana1.cortarIngrediente();
  limao1.cortarIngrediente();

  if (diasDesdeColheita >= 30) {
    isMadura = true;
  } else {
    isMadura = false;
  }
}

int funcQuantosDiasMadura(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}

mostrarMadura({required String nome, required int dias, required String cor}) {
  if (dias >= 30) {
    print("A $nome está madura.");
  } else {
    print("A $nome não está madura.");
  }

  if (cor != null) {
    print("A $nome é $cor!");
  }
}

bool funcEstaMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}

String toString(
    {required String nome,
    required double peso,
    required int diasDesdeColheita,
    int diasParaMadurar = 30,
    bool? isMadura}) {
  if (isMadura == null) {
    isMadura = diasDesdeColheita >= diasParaMadurar;
  }
  String maduraString = "";
  if (isMadura != null && !isMadura) {
    maduraString = 'não';
  }
  String result =
      "A $nome pesa $peso gramas! Ela foi colhida há $diasDesdeColheita dias e precisa de $diasParaMadurar dias para amadurecer, logo, a $nome ${maduraString} está madura.";
  return result;
}

class Fruta extends Alimento implements Bolo, Drink {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  void estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print(
        "A sua $nome foi colhida a $diasDesdeColheita dias, e precisa de $diasParaMadura para poder comer. Ela está madura? $isMadura");
  }

  void fazerSuco() {
    print('Você fez um suco de $nome');
  }

  @override
  void separarIngredientes() {
    print('Catar a fruta');
  }

  @override
  void fazerMassa() {
    print('Misturar a $nome com farinha, açucar, ovos...');
  }

  @override
  void assar() {
    print('Colocar no forno');
  }

  @override
  void cortarIngrediente() {
    print('Cortando $nome...');
  }

  @override
  void colocarBebida() {
    print('Colocando a bebida na coqueteleira');
  }

  @override
  void prepararDrink() {
    print('Preparando o Drink!');
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;
  Alimento(this.nome, this.peso, this.cor);
  void printAlimento() {
    print('Este(a) $nome pesa $peso gramas e é $cor.');
  }
}

class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print('Pronto, o $nome está cozido!');
    } else {
      print("Nem precisa cozinhar");
    }
  }

  @override
  void assar() {}

  @override
  void fazerMassa() {}

  @override
  void separarIngredientes() {}
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.nivelAzedo)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe) {
    if (existe) {
      print('Existe refrigerante de $nome');
    } else {
      print('Não existe refrigerante de $nome');
    }
  }

  @override
  void cortarIngrediente() {
    print('Tirando o miolo para não amargar');
    super.cortarIngrediente();
  }
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;
  Nozes(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.porcentagemOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void fazerMassa() {
    print('Tirar a casca');
    super.fazerMassa();
  }
}

abstract class Bolo {
  void separarIngredientes();

  void fazerMassa();

  void assar();
}

abstract class Drink {
  void cortarIngrediente();
  void colocarBebida();
  void prepararDrink();
}
