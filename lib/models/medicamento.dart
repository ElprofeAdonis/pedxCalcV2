class Medicamento {
  final String id;
  final String nombre;
  final String categoria;
  final String? subcategoria;
  final String Infusion;

  final String observaciones;
  final String rangoDosisOriginal;
  final String SituacionesEspeciales;
  final String dosisActualMG; // Este es el valor base/observación de MG
  final double?
  dosisMl; // Dosis en ml, puede ser null si no aplica o se calcula
  final double? dosisJulios;

  // Campos para la lógica de cálculo (ya los tienes)
  final double? dosisBaseMgKg;
  final double? dosisBaseMlKg;
  final double? dosisFijaMl;
  final double? dosisFijaMg;
  final double? factorDilucion;

  String? dosisFinalMl; // La dosis final calculada en ML para el paciente
  String? dosisFinalMg; // La dosis final calculada en MG para el paciente
  String? dosisFinalJulios; // Si aplica para descargas eléctricas

  Medicamento({
    required this.id,
    required this.nombre,
    required this.categoria,
    this.Infusion = '',
    this.SituacionesEspeciales = '',
    this.subcategoria,
    this.observaciones = '',
    this.rangoDosisOriginal = '',
    this.dosisActualMG = '',
    this.dosisBaseMgKg,
    this.dosisBaseMlKg,
    this.dosisFijaMl,
    this.dosisFijaMg,
    this.factorDilucion,
    this.dosisMl,
    this.dosisJulios,
    // No incluyas dosisFinalMl, dosisFinalMg, dosisFinalJulios en el constructor principal
    // porque estos se asignarán DESPUÉS del cálculo.
  });

  // Método para actualizar las dosis calculadas (para la Opción 1)
  void setDosisCalculadas({String? ml, String? mg, String? julios}) {
    dosisFinalMl = ml;
    dosisFinalMg = mg;
    dosisFinalJulios = julios;
  }
}
