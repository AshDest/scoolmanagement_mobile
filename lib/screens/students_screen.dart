import 'package:flutter/material.dart';
import '../models/student.dart';
import '../services/student_service.dart';
import '../utils/constants.dart';
import '../widgets/custom_card.dart';

String _formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  List<Student> _students = [];
  List<Student> _filteredStudents = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadStudents();
    _searchController.addListener(_filterStudents);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadStudents() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final students = await StudentService.getAllStudents();
      setState(() {
        _students = students;
        _filteredStudents = students;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _filterStudents() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredStudents = _students.where((student) {
        return student.fullName.toLowerCase().contains(query) ||
            student.email.toLowerCase().contains(query) ||
            student.className.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryBlue,
        title: const Text(
          'Étudiants',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.white),
            onPressed: _loadStudents,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.white,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher un étudiant...',
                prefixIcon: const Icon(Icons.search, color: AppColors.primaryBlue),
                filled: true,
                fillColor: AppColors.lightGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          // Students list
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryBlue,
                    ),
                  )
                : _filteredStudents.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.people_outline,
                              size: 64,
                              color: AppColors.textSecondary.withValues(alpha: 0.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Aucun étudiant trouvé',
                              style: AppStyles.bodyLarge.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: _loadStudents,
                        color: AppColors.primaryBlue,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: _filteredStudents.length,
                          itemBuilder: (context, index) {
                            return _buildStudentCard(_filteredStudents[index]);
                          },
                        ),
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to add student screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Fonctionnalité à venir'),
              backgroundColor: AppColors.info,
            ),
          );
        },
        backgroundColor: AppColors.primaryBlue,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  Widget _buildStudentCard(Student student) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: CustomCard(
        onTap: () => _showStudentDetails(student),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  student.firstName[0].toUpperCase() + student.lastName[0].toUpperCase(),
                  style: AppStyles.heading3.copyWith(
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Student info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.fullName,
                    style: AppStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.class_,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        student.className,
                        style: AppStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          student.email,
                          style: AppStyles.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Arrow icon
            const Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  void _showStudentDetails(Student student) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.mediumGrey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        student.firstName[0].toUpperCase() + student.lastName[0].toUpperCase(),
                        style: AppStyles.heading1.copyWith(
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          student.fullName,
                          style: AppStyles.heading2,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            student.className,
                            style: AppStyles.bodySmall.copyWith(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Details
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Informations', style: AppStyles.heading3),
                    const SizedBox(height: 16),
                    _buildDetailRow(Icons.email, 'Email', student.email),
                    _buildDetailRow(Icons.phone, 'Téléphone', student.phone),
                    _buildDetailRow(
                      Icons.cake,
                      'Date de naissance',
                      _formatDate(student.dateOfBirth),
                    ),
                    _buildDetailRow(Icons.location_on, 'Adresse', student.address),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primaryBlue, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: AppStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

