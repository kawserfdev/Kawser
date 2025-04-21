// lib/widgets/firebase_status.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawser/providers/providers.dart';
  
class FirebaseStatusIndicator extends ConsumerWidget {
  const FirebaseStatusIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use a simple provider stream to check Firebase availability
    final skillsStream = ref.watch(skillsProvider);
    
    return skillsStream.when(
      data: (_) => const _StatusWidget(
        color: Colors.green,
        icon: Icons.cloud_done,
        text: "Connected",
      ),
      loading: () => const _StatusWidget(
        color: Colors.blue,
        icon: Icons.cloud_sync,
        text: "Connecting...",
      ),
      error: (_, __) => const _StatusWidget(
        color: Colors.red,
        icon: Icons.cloud_off,
        text: "Disconnected",
      ),
    );
  }
}

class _StatusWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  
  const _StatusWidget({
    required this.color,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(color: color, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
