// terms_conditions_screen.dart
import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF667eea),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.gavel,
                        size: 32,
                        color: Color(0xFF667eea),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Last updated: January 2025',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Highlight Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF667eea).withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFF667eea), width: 2),
              ),
              child: const Text(
                'By using GMarket, you agree to these terms and conditions. Please read them carefully.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2d3748),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 30),

            // Terms Sections
            _buildTermsSection(
              '1. Acceptance of Terms',
              'By accessing and using the GMarket platform, you accept and agree to be bound by these Terms and Conditions and our Privacy Policy. If you do not agree to these terms, please do not use our services.',
            ),

            _buildTermsSection(
              '2. User Accounts',
              'You must create an account to make purchases. You are responsible for maintaining the confidentiality of your account information and for all activities under your account. You must provide accurate and complete information during registration.',
            ),

            _buildTermsSection(
              '3. Product Information',
              'We strive to provide accurate product information, but we do not warrant that product descriptions, prices, or other content is accurate, complete, or current. All products are subject to availability and we reserve the right to discontinue any product at any time.',
            ),

            _buildTermsSection(
              '4. Orders and Payments',
              'All orders are subject to acceptance and availability. We reserve the right to refuse any order for any reason. Payment must be received before order processing. All prices are subject to change without notice.',
            ),

            _buildTermsSection(
              '5. Shipping and Delivery',
              'Delivery times are estimates and may vary based on location and product availability. We are not responsible for delays caused by circumstances beyond our control, including but not limited to natural disasters, strikes, or shipping carrier delays.',
            ),

            _buildTermsSection(
              '6. Returns and Refunds',
              'Returns are accepted within 30 days of purchase for eligible items in original condition with original packaging. Digital products and personalized items are non-returnable. Refunds will be processed within 5-10 business days after we receive your returned item.',
            ),

            _buildTermsSection(
              '7. User Conduct',
              'You agree not to use the platform for any unlawful purpose or in any way that could damage, disable, overburden, or impair the service. You may not attempt to gain unauthorized access to any part of the platform.',
            ),

            _buildTermsSection(
              '8. Intellectual Property',
              'All content on GMarket, including but not limited to text, graphics, logos, images, and software, is protected by copyright and other intellectual property laws. You may not reproduce, distribute, or create derivative works without our express written permission.',
            ),

            _buildTermsSection(
              '9. Limitation of Liability',
              'GMarket shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of the platform. Our total liability shall not exceed the amount you paid for the specific product or service.',
            ),

            _buildTermsSection(
              '10. Privacy Policy',
              'Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and protect your personal information. By using our services, you consent to the collection and use of your information as described in our Privacy Policy.',
            ),

            _buildTermsSection(
              '11. Modifications',
              'We reserve the right to modify these terms at any time without prior notice. Changes will be effective immediately upon posting on our platform. Your continued use of the service after any changes constitutes acceptance of the new terms.',
            ),

            _buildTermsSection(
              '12. Dispute Resolution',
              'Any disputes arising from these terms or your use of our services will be resolved through binding arbitration in accordance with the rules of the American Arbitration Association. You waive any right to a jury trial or class action lawsuit.',
            ),

            _buildTermsSection(
              '13. Governing Law',
              'These terms shall be governed by and construed in accordance with the laws of the State of New York, without regard to its conflict of law provisions. Any legal action must be brought in the courts of New York.',
            ),

            _buildTermsSection(
              '14. Severability',
              'If any provision of these terms is found to be unenforceable or invalid, the remaining provisions will continue to be valid and enforceable. The invalid provision will be modified to the minimum extent necessary to make it enforceable.',
            ),

            _buildTermsSection(
              '15. Contact Information',
              'For questions about these Terms and Conditions, please contact us at legal@gmarket.com or write to us at GMarket Legal Department, 123 Commerce Street, Business District, NY 10001.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsSection(String title, String content) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF4a5568),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
