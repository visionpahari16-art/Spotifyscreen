import 'package:flutter/material.dart';

class SpotifyScreen extends StatefulWidget {
  const SpotifyScreen({super.key});

  @override
  State<SpotifyScreen> createState() => _SpotifyScreenState();
}

class _SpotifyScreenState extends State<SpotifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        title: const Text(
          "Recently played",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 16,
        actions: const [
          Icon(Icons.notifications_none_outlined, color: Colors.white, size: 26),
          SizedBox(width: 16),
          Icon(Icons.history, color: Colors.white, size: 26),
          SizedBox(width: 16),
          Icon(Icons.settings_outlined, color: Colors.white, size: 26),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recently Played Artists Row
            Row(
              children: [
                _buildArtistItem("Lana Del Rey", "assets/images/img_1.png"),
                const SizedBox(width: 20),
                _buildArtistItem("Marvin Gaye", "assets/images/img_2.png"),
              ],
            ),

            const SizedBox(height: 24),

            // Spotify Wrapped Banner
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/images/img_3.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "#SPOTIFYWRAPPED",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Your 2021 in review",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 2021 Review Grid Cards
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildCardItem(
                    imagePath: 'assets/images/img_4.png',
                    title: "Your Top Songs 2021",
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildCardItem(
                    imagePath: 'assets/images/img_5.png',
                    title: "Your Artists Revealed",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Editor's picks Header
            const Text(
              "Editor’s picks",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Editor's picks Grid Cards
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildEditorPickItem(
                    imagePath: 'assets/images/img_6.png',
                    subtitle: "Ed Sheeran, Big Sean, Juice WRLD, Post Malone",
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildEditorPickItem(
                    imagePath: 'assets/images/img_7.png',
                    subtitle: "Mitski, Tame Impala, Glass Animals, Charli XCX",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildArtistItem(String name, String imagePath) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCardItem({required String imagePath, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildEditorPickItem({required String imagePath, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 12,
            height: 1.3,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}