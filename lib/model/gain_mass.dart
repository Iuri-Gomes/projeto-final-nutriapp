

class PersonGainMass {

  double weight;


  PersonGainMass(this.weight);

  double calculateDiaryKcal() {
    return weight * 50;
  }

  double getProtein() {
    return 4 / (calculateDiaryKcal() * 0.40);
  }

  double getFat() {
    return 9 / (calculateDiaryKcal() * 0.30);
  }

  double getCarb() {
    return 4 / (calculateDiaryKcal() * 0.60);
  }

  @override
  String toString() {
    return 'Você deve consumir no dia:\n ${calculateDiaryKcal()} calorias\n ${getProtein()} g de Proteina\n ${getFat()} g de Gordura\n ${getCarb()} g de Carboidratos. ';
  }

}
