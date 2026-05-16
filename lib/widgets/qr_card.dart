import 'package:flutter/material.dart';
import '../models/qr_model.dart';

class QRCard extends StatelessWidget {
  final QRModel qrCode;

  const QRCard({
    super.key,
    required this.qrCode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(qrCode.getFormattedContent()),
        subtitle: Text(qrCode.createdAt.toString()),
        leading: const Icon(Icons.qr_code),
      ),
    );
  }
}
