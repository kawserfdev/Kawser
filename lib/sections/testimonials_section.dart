import 'package:flutter/material.dart';
import 'package:kawser/view/components/section_title.dart';
import 'package:kawser/view/components/testimonial_card.dart';
import '../responsive_helper.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final containerWidth = ResponsiveHelper.getContainerWidth(context);

    final testimonials = [
      {
        'testimonial':
            '"Kawser has been instrumental in developing our mobile app from scratch. His expertise in Flutter and attention to detail resulted in a high-quality application that our customers love. His ability to solve complex problems efficiently makes him a valuable asset to any development team."',
        'name': 'Mohammad Akash',
        'position': 'CEO, GhorerBazar',
      },
      {
        'testimonial':
            '"Working with Kawser on the Shpper app was a great experience. He quickly grasped our requirements and implemented features that exceeded our expectations. His knowledge of Flutter and various integration points made our app development process smooth."',
        'name': 'Sarah Khan',
        'position': 'Product Manager, Shpper',
      },
      {
        'testimonial':
            '"As an intern at our company, Kawser showed exceptional potential and quickly adapted to our development processes. His dedication to learning and problem-solving skills led to his promotion to a junior developer role in record time."',
        'name': 'Mahmud Hasan',
        'position': 'CTO, RBF Tech Zone',
      },
      {
        'testimonial':
            '"Kawser\'s implementation of our partial payment system was flawless. He understood the complex business requirements and translated them into an intuitive user interface that simplified the payment process for our customers."',
        'name': 'Raisa Ahmed',
        'position': 'Product Owner, GhorerBazar',
      },
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFF191919),
      padding: ResponsiveHelper.getPagePadding(context),
      child: Center(
        child: Container(
          width: containerWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: "Testimonials"),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: isMobile ? .9 : 1.5,
                ),
                itemCount: testimonials.length,
                itemBuilder: (context, index) {
                  final testimonial = testimonials[index];
                  return TestimonialCard(
                    testimonial: testimonial['testimonial'] as String,
                    name: testimonial['name'] as String,
                    position: testimonial['position'] as String,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
