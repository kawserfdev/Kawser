import 'package:flutter/material.dart';

class TestimonialCard extends StatelessWidget {
  final String testimonial;
  final String name;
  final String position;
  final VoidCallback? onTap;
  
  const TestimonialCard({
    Key? key,
    required this.testimonial,
    required this.name,
    required this.position,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Make sure this has a color
        borderRadius: BorderRadius.circular(8),
      ),
      // Constrain the height to prevent layout issues
      constraints: const BoxConstraints(minHeight: 250),
      child: Stack(
        children: [
          Positioned(
            top: -10,
            left: 10,
            child: Text(
              '"',
              style: TextStyle(
                fontFamily: 'serif',
                fontSize: 80,
                color: Colors.grey[800],
                height: 1,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  testimonial,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Color(0xFFBDBDBD), // Light grey text
                    fontSize: 16,
                    height: 1.6,
                  ),
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(), // Push the avatar and name to the bottom
              GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xFF333333),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                          color: Color(0xFF666666),
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          position,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFBDBDBD),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}