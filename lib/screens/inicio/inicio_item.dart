import 'package:flutter/material.dart';

class InicioItem {
  final String title;
  final String categoria;
  final double distancia;
  final int tempoEntrega;
  final double frete;
  final ImageProvider<Object>? image;
  final void Function(BuildContext) event;

  const InicioItem({
    required this.title,
    required this.categoria,
    required this.distancia,
    required this.tempoEntrega,
    required this.frete,
    required this.image,
    required this.event,
  });
}
