import 'package:flutter/material.dart';

class UserAgreement extends StatelessWidget {
  const UserAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Agreement'), centerTitle: true),
      body: const SafeArea(child: _AgreementContent()),
    );
  }
}

class _AgreementContent extends StatelessWidget {
  const _AgreementContent();

  Widget _sectionTitle(String text) => Padding(
    padding: const EdgeInsets.only(top: 18.0, bottom: 8.0),
    child: Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );

  Widget _sectionBody(String text) =>
      Text(text, style: const TextStyle(fontSize: 15, height: 1.4));

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Center(
              child: Text(
                'PUPSIGHT User Agreement',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            const SizedBox(height: 22),

            _sectionTitle('I. Scope'),
            _sectionBody(
              'This User Agreement sets out the terms and conditions under which users may access and use the PUPSIGHT mobile application and related services. It applies to all users, including students, faculty, staff, and visitors who access PUPSIGHT features.',
            ),

            _sectionTitle('II. Terms of use'),
            _sectionBody(
              'Users must use the application lawfully and in accordance with applicable policies. Prohibited activities include unauthorized access, tampering with app functionality, distributing malware, and any conduct that interferes with other users\' enjoyment of the service. The app owner reserves the right to suspend or terminate accounts that violate these terms.',
            ),

            _sectionTitle('III. Privacy'),
            _sectionBody(
              'PUPSIGHT collects and processes personal information necessary to provide services (for example: account information, location data when enabled, and usage analytics). Personal data will be handled in accordance with applicable data protection laws and the app\'s privacy policy. Users should review the full privacy policy for details on data collection, storage, security measures, and how to exercise their privacy rights.',
            ),

            _sectionTitle('IV. Limitation of liability and disclaimer'),
            _sectionBody(
              'To the maximum extent permitted by law, PUPSIGHT and its affiliates provide the app on an \"as is\" and \"as available\" basis and disclaim all warranties, whether express or implied. PUPSIGHT is not liable for any indirect, incidental, consequential, or punitive damages arising from the use of the app, loss of data, or disruption of services. Users rely on the app at their own risk. Certain jurisdictions may not allow limitations on liability, so these limitations may not apply to every user.',
            ),
          ],
        ),
      ),
    );
  }

  static String _formattedToday() {
    final now = DateTime.now();
    return '${now.year.toString().padLeft(4, '0')}-'
        '${now.month.toString().padLeft(2, '0')}-'
        '${now.day.toString().padLeft(2, '0')}';
  }
}
