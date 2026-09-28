import 'package:flutter/material.dart';
import '../models/destination.dart';
import 'home.dart';

class Detail extends StatelessWidget {
  final DestinationModel destination;

  const Detail({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFCBE3F7), Color(0xFFE4F0FB), Color(0xFFF7FAFF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, 
        appBar: AppBar(
          backgroundColor: Colors.white, 
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.2),
          title: Text(
            destination.name,
            style: TextStyle(
              color: Color(0xFF0F172A),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          iconTheme: IconThemeData(color: Color(0xFF0F172A)),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 12,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      destination.imageUrl,
                      height: 260,
                      width: 175,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 260,
                          width: 175,
                          color: Color(0xFFE2E8F0),
                          child: Icon(
                            Icons.image_not_supported_rounded,
                            color: Color(0xFF475569),
                            size: 40,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Judul buku
              Center(
                child: Text(
                  destination.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F172A),
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              SizedBox(height: 6),
              // Center(
              //   child: Text(
              //     "Penulis: ${dest.author}",
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500,
              //       color: Color(0xFF64748B),
              //     ),
              //   ),
              // ),
              SizedBox(height: 28),

              // Rating, Halaman, Tahun 
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // children: [
                //   _buildTextStat(book.rating.toString(), 'Rating'),
                //   Container(width: 1, height: 30, color: Color(0xFFCBD5E1)), // Garis pemisah tipis
                //   _buildTextStat(book.pages.toString(), 'Halaman'),
                //   Container(width: 1, height: 30, color: Color(0xFFCBD5E1)), // Garis pemisah tipis
                //   _buildTextStat(book.year.toString(), 'Tahun'),
                // ],
              ),
              SizedBox(height: 32),

              // Deskripsi buku
              Text(
                "Sinopsis",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF6B82A8).withOpacity(0.08),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Text(
                  destination.description,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF475569),
                    height: 1.6, 
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 24),

              // Detail Lainnya
              Text(
                "Detail Lainnya",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF6B82A8).withOpacity(0.08),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                // child: Column(
                //   children: [
                //     _buildDetailRow("Genre", book.genre),
                //     Divider(height: 24, color: Color(0xFFE2E8F0)),
                //     _buildDetailRow("Penerbit", book.publisher),
                //   ],
                // ),
              ),
              SizedBox(height: 32), 
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  // Genre dan Penerbit
  Widget _buildDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF64748B),
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
        ),
      ],
    );
  }
}