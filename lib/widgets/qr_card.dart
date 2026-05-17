import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/qr_model.dart';
import '../constants/app_constants.dart';

class QRCard extends StatelessWidget {
  final QRModel qrCode;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;

  const QRCard({
    super.key,
    required this.qrCode,
    this.onDelete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy HH:mm');

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                _getTypeIcon(),
                size: 32,
                color: Colors.blue,
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      qrCode.getFormattedContent(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    Text(
                      qrCode.isScanned
                          ? '${AppConstants.scannedAtLabel}${dateFormat.format(qrCode.createdAt)}'
                          : '${AppConstants.generatedAtLabel}${dateFormat.format(qrCode.createdAt)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: qrCode.isScanned
                      ? Colors.green
                      : Colors.blue,
                  borderRadius:
                      BorderRadius.circular(12),
                ),
                child: Text(
                  qrCode.isScanned
                      ? 'Scanned'
                      : 'Generated',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),

              if (onDelete != null)
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getTypeIcon() {
    switch (qrCode.type) {
      case QRType.url:
        return Icons.link;

      case QRType.contact:
        return Icons.person;

      case QRType.wifi:
        return Icons.wifi;

      case QRType.text:
      default:
        return Icons.text_fields;
    }
  }
}
