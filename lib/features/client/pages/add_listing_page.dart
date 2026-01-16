import 'package:flutter/material.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';

class AddListingPage extends StatefulWidget {
  final bool isEditing;

  const AddListingPage({super.key, this.isEditing = false});

  @override
  State<AddListingPage> createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  // 1 = Fixed Price, 2 = Open to Bids
  int _pricingType = 2; // Default to Open to Bids as per mockup usually
  // 1 = Client Job, 2 = Company Sublet Job
  int _jobType = 1;

  @override
  Widget build(BuildContext context) {
    const Color primaryDarkColor = Color(0xFF2C3E38);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: primaryDarkColor,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              color: primaryDarkColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isEditing ? 'Edit Listing' : 'Add Listing',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Create a job listing for tradespeople to bid on or accept.',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),

            // Form Content
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Job Title'),
                  _buildTextField(hint: 'e.g., Paint 2-bed terrace exterior'),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Trade Category'),
                            _buildTextField(hint: 'Select'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel(
                              'Trade Category',
                            ), // Label says Category but field implies Postcode
                            _buildTextField(hint: 'DN31 1AA'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildLabel('Budget'),
                  Row(
                    children: [
                      Expanded(flex: 2, child: _buildTextField(hint: '£ ___')),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 4,
                        child: Row(
                          children: [
                            _buildRadioButton(
                              1,
                              'Fixed Price',
                              _pricingType,
                              (val) => setState(() => _pricingType = val),
                            ),
                            const SizedBox(width: 8),
                            _buildRadioButton(
                              2,
                              'Open to Bids',
                              _pricingType,
                              (val) => setState(() => _pricingType = val),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildLabel('Desired Start Date'),
                  _buildTextField(
                    hint: 'e.g., Paint 2-bed terrace exterior',
                  ), // Hint from mockup seems copy-pasted in mockup? I'll use mockup text.
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      3,
                      (index) => Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F8FA),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.blueGrey[300],
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Add up to 10 photos • Use camera or gallery',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  _buildLabel('Job Description'),
                  _buildTextField(
                    hint:
                        'Please paint front & back exterior incl. doors and frames.\nSupply own materials. Minor pre-filling needed. Scaffold may\nbe required. Ideally completed within 2 weeks.',
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),
                  _buildLabel('Link a Specific Trades person (optional)'),
                  _buildTextField(hint: 'Enter email or TradeLock ID'),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _buildRadioButton(
                        1,
                        'Client Job',
                        _jobType,
                        (val) => setState(() => _jobType = val),
                      ),
                      const SizedBox(width: 20),
                      _buildRadioButton(
                        2,
                        'Company Sublet Job',
                        _jobType,
                        (val) => setState(() => _jobType = val),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Post Job
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryDarkColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: widget.isEditing
                          ? const Text(
                              'Update Job',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Post Job',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  if (widget.isEditing) ...[
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Delete
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Delete Job',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF1B3B36),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF2C3E38)),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }

  Widget _buildRadioButton(
    int value,
    String label,
    int groupValue,
    Function(int) onChanged,
  ) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: groupValue == value
                    ? const Color(0xFF1B3B36)
                    : Colors.grey.shade400,
                width: 1.5,
              ),
            ),
            padding: const EdgeInsets.all(2),
            child: groupValue == value
                ? Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF1B3B36),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
        ],
      ),
    );
  }
}
