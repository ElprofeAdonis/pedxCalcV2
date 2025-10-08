class Paciente {
  double pesoKg;
  int edadAnios;
  int edadMeses; // Solo si edadAnios es 0 o para mayor precisión

  Paciente({
    required this.pesoKg,
    required this.edadAnios,
    required this.edadMeses,
  });
}
