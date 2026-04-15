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
            '"I had the pleasure of working with Kawser at Pixel & Code for several months, and I was consistently impressed by his technical expertise and professionalism. He possesses strong skills in Flutter development and demonstrates a solid understanding of building high-quality, scalable applications. Kawser is a fast learner who eagerly takes on new challenges and approaches problem-solving with a proactive and positive mindset. He is highly reliable, pays attention to detail, and consistently delivers excellent results.Beyond his technical abilities, Kawser is a great team player. He communicates clearly, collaborates effectively, and contributes positively to the work environment.I strongly recommend Kawser for any Flutter development role. He would be a valuable asset to any team."',
        'name': 'Yeamin Madbor',
        'position': 'CEO & Founder, Pixel & Code  IT agency',
        'imageUrl': 'https://pixelandcode.agency/',
      },
      {
        'testimonial':
            '"I had the opportunity to work with Kawser for over a year at Mysoft Heaven Limited. During this time, I was consistently impressed by his strong technical skills, particularly in Flutter development. He is a quick learner, always eager to take on new challenges, and approaches problem-solving with a positive and proactive attitude. Kawser is also a great team player, communicates effectively, and is dedicated to delivering high-quality work. I highly recommend him for any Flutter development role."',
        'name': 'Imdadul Haque',
        'position': 'Team Lead, Mysoft Heaven Ltd.',
        'imageUrl':
            'https://media.licdn.com/dms/image/v2/D5635AQEyjVrki9vCKw/profile-framedphoto-shrink_800_800/profile-framedphoto-shrink_800_800/0/1730174847109?e=1776794400&v=beta&t=ykwVQ2twpbWraBP46DFxtNADSRKaK2z8p5Q-olNXjtM',
      },
      {
        'testimonial':
            '"Kawser has been instrumental in developing our mobile app from scratch. His expertise in Flutter and attention to detail resulted in a high-quality application that our customers love. His ability to solve complex problems efficiently makes him a valuable asset to any development team."',
        'name': 'Faysal Ahmed',
        'position': 'Head of IT, GhorerBazar',
        'imageUrl': 'https://www.linkedin.com/in/faysalahmedshohel/',
      },
      {
        'testimonial':
            '"Kawser\'s implementation of our partial payment system was flawless. He understood the complex business requirements and translated them into an intuitive user interface that simplified the payment process for our customers."',
        'name': 'Emtius Evan',
        'position': 'Product Analyst, GhorerBazar',
        'imageUrl': 'https://www.linkedin.com/in/emtius-evan-a13019205/',
      },
      {
        'testimonial':
            '"Working with Kawser on the Shpper app was a great experience. He quickly grasped our requirements and implemented features that exceeded our expectations. His knowledge of Flutter and various integration points made our app development process smooth."',
        'name': 'K M Shahriar Hossain',
        'position': 'CTO, Shpper',
        'imageUrl': 'https://www.linkedin.com/in/devshakib015/',
      },
      {
        'testimonial':
            '"Kawser demonstrated exceptional attention to detail while developing pixel-perfect UIs for our Learning Campus project. His ability to transform complex design requirements into clean, efficient, and maintainable Flutter code significantly improved the user experience. He was also a great team player, collaborating smoothly through GitHub and following best practices consistently."',
        'name': 'Abdul Momen',
        'position': 'Owner, Nodex System',
        'imageUrl': 'https://www.linkedin.com/in/abdul-momen-7446071a4/',
      },
      {
        'testimonial':
            '"As an intern at our company, Kawser showed exceptional potential and quickly adapted to our development processes. His dedication to learning and problem-solving skills led to his promotion to a junior developer role in record time."',
        'name': 'Abdullah Ibne Muqta',
        'position': 'CTO, RBF Tech Zone',
        'imageUrl': '',
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
                  childAspectRatio: isMobile ? 0.8 : 1.2, //
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
