import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final Map<String, int> _ratings = {};
  final TextEditingController _commentsController = TextEditingController();

  void _submitFeedback() {
    debugPrint("User Feedback:");
    _ratings.forEach((question, rating) {
      debugPrint("$question: $rating");
    });
    debugPrint("Comments: ${_commentsController.text}");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Thank you for your feedback!")),
    );

    _commentsController.clear();
    setState(() {
      _ratings.clear();
    });
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildRatingQuestion(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) {
            final rating = index + 1;
            return ChoiceChip(
              label: Text("$rating"),
              selected: _ratings[question] == rating,
              onSelected: (_) {
                setState(() {
                  _ratings[question] = rating;
                });
              },
            );
          }),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PUPSIGHT Feedback")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Intro / Agreement
            const Text(
              "PUPSIGHT: An Augmented Reality Navigation and Information App "
              "for PUP Biñan Campuses",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "☐ I voluntarily agree to participate in this evaluation of the "
              "PUPSIGHT system. I understand that the information I provide will be "
              "used solely for academic research and system improvement purposes. "
              "My responses will be kept confidential and used in accordance with "
              "the Data Privacy Act of 2012 (RA 10173). I understand that I can "
              "withdraw at any time without penalty.\n\n"
              "Please read each statement carefully and indicate the extent to "
              "which you agree or disagree by selecting the most appropriate "
              "response based on your experience and opinion while using the "
              "PUPSIGHT Augmented Reality Navigation System. Your feedback will "
              "help the researchers assess the system’s functionality, performance, "
              "and usability to improve future versions.\n\n"
              "Use the following scale:\n"
              "(1) Poor - Strongly disagree; the system failed to meet expectations.\n"
              "(2) Fair - Slightly disagree; noticeable issues.\n"
              "(3) Satisfactory - Neutral; worked with minor issues.\n"
              "(4) Good - Agree; met expectations effectively.\n"
              "(5) Excellent - Strongly agree; exceeded expectations.",
              style: TextStyle(fontSize: 14),
            ),
            const Divider(height: 30, thickness: 1),

            // 🔹 Section 1
            _buildSectionTitle("Section 1: Feature Performance"),
            _buildRatingQuestion(
              "1. Does the system deliver all its intended features (e.g., AR navigation, location detection) without failure?",
            ),
            _buildRatingQuestion(
              "2. Does the system accurately reflect the user's position and directions in real time?",
            ),
            _buildRatingQuestion(
              "3. Does the system manage unexpected inputs or actions gracefully (e.g., no crashes or freezes)?",
            ),
            _buildRatingQuestion(
              "4. How reliable is the system during normal use over time?",
            ),
            _buildRatingQuestion(
              "5. The system worked properly on my device without technical issues.",
            ),

            // 🔹 Section 2
            _buildSectionTitle(
              "Section 2: System Speed and Overall Performance",
            ),
            _buildRatingQuestion(
              "1. How fast do features like AR, map overlays, and dashboard load?",
            ),
            _buildRatingQuestion(
              "2. Does the system run smoothly without lag or delay during use?",
            ),
            _buildRatingQuestion(
              "3. Is the system responsive during navigation and interactions (e.g., voice guide, button clicks)?",
            ),
            _buildRatingQuestion(
              "4. Were the features easy to access and use, regardless of your technical experience?",
            ),
            _buildRatingQuestion(
              "5. Are images, AR features, and other components designed to run efficiently?",
            ),

            // 🔹 Section 3
            _buildSectionTitle(
              "Section 3: Ease of Use and User Interface Experience",
            ),
            _buildRatingQuestion(
              "1. Is the interface easy to understand and navigate for students and staff?",
            ),
            _buildRatingQuestion(
              "2. How satisfied are the users with the overall experience?",
            ),
            _buildRatingQuestion(
              "3. Does the system provide clear instructions, labels, and feedback to guide the user?",
            ),
            _buildRatingQuestion(
              "4. Is the visual design appealing, clear, and helpful in guiding users?",
            ),
            _buildRatingQuestion(
              "5. How quickly can new users learn to use the system effectively?",
            ),

            // 🔹 Section 4
            _buildSectionTitle(
              "Section 4: System Feedback and Improvement Opportunities",
            ),
            _buildRatingQuestion(
              "1. The system helped me easily find my way around the campus.",
            ),
            _buildRatingQuestion(
              "2. The system performed well regardless of where I used it around the campus.",
            ),
            _buildRatingQuestion(
              "3. The system includes all the important features needed for effective navigation.",
            ),
            _buildRatingQuestion(
              "4. I believe the system can still be improved to enhance the overall experience.",
            ),
            _buildRatingQuestion(
              "5. I would recommend this system to other students or visitors on campus.",
            ),

            // 🔹 Open-ended question
            const SizedBox(height: 20),
            const Text(
              "Open-Ended Question:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _commentsController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    "What features, improvements, or suggestions would you recommend?",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _submitFeedback,
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
