import 'package:flutter/material.dart';

class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
}
