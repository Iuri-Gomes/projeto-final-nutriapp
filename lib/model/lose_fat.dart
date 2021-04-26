

class PersonLoseFat {

  double weight;


  PersonLoseFat(this.weight);

  double calculateDiaryKcal() {
    return weight * 25;
  }

  double getProtein() {
    return 4 / (calculateDiaryKcal() * 0.30);
  }

  double getFat() {
    return 9 / (calculateDiaryKcal() * 0.2);
  }

  double getCarb() {
    return 4 / (calculateDiaryKcal() * 0.5);
  }

  @override
  String toString() {
    return 'Você deve consumir no dia:\n ${calculateDiaryKcal()} calorias\n ${getProtein()} g de Proteina\n ${getFat()} g de Gordura\n ${getCarb()} g de Carboidratos. ';
  }
}