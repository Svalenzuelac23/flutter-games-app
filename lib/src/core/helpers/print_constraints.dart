import 'package:flutter/cupertino.dart';

void printConstraints(BoxConstraints constraints) {
  print('Ancho minimo: ${constraints.minWidth}');
  print('Ancho maximo: ${constraints.maxWidth}');
  print('Alto minimo: ${constraints.minHeight}');
  print('Alto maximo: ${constraints.maxHeight}');
}
