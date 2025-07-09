import 'package:flutter/material.dart';

class DashboarScreen extends StatelessWidget {
  const DashboarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6BB6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6BB6FF),
        elevation: 0,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: const SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 16),
              _DashboardCard(
                title: 'Machine Status',
                icon: Icons.precision_manufacturing,
                iconColor: Colors.blue,
                dropdownItems: [
                  'All Machines',
                  'Building A',
                  'Building B',
                  'Building C'
                ],
                content: Column(
                  children: [
                    _StatusRow('Running', 12, Colors.green),
                    SizedBox(height: 8),
                    _StatusRow('Maintenance', 3, Colors.orange),
                    SizedBox(height: 8),
                    _StatusRow('Offline', 2, Colors.red),
                  ],
                ),
              ),
              SizedBox(height: 16),
              _DashboardCard(
                title: 'Production Statistics',
                icon: Icons.bar_chart,
                iconColor: Colors.purple,
                dropdownItems: [
                  'Today',
                  'This Week',
                  'This Month',
                  'This Year'
                ],
                content: Column(
                  children: [
                    _StatRow('Total Production', '1,245 units'),
                    SizedBox(height: 8),
                    _StatRow('Efficiency Rate', '89.5%'),
                    SizedBox(height: 8),
                    _StatRow('Defect Rate', '2.1%'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              _DashboardCard(
                title: 'Maintenance Schedule',
                icon: Icons.build,
                iconColor: Colors.orange,
                dropdownItems: [
                  'All Departments',
                  'Mechanical',
                  'Electrical',
                  'Software'
                ],
                content: Column(
                  children: [
                    _MaintenanceRow('Scheduled', 5, Colors.blue),
                    SizedBox(height: 8),
                    _MaintenanceRow('In Progress', 2, Colors.orange),
                    SizedBox(height: 8),
                    _MaintenanceRow('Completed', 8, Colors.green),
                  ],
                ),
              ),
              SizedBox(height: 16),
              _DashboardCard(
                title: 'Reports & Analytics',
                icon: Icons.analytics,
                iconColor: Colors.teal,
                dropdownItems: [
                  'Last 7 Days',
                  'Last 30 Days',
                  'Last 3 Months',
                  'Last Year'
                ],
                content: Column(
                  children: [
                    _ReportRow('Quality Reports', 'Generated'),
                    SizedBox(height: 8),
                    _ReportRow('Performance Analysis', 'In Progress'),
                    SizedBox(height: 8),
                    _ReportRow('Cost Analysis', 'Pending'),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final List<String> dropdownItems;
  final Widget content;

  const _DashboardCard({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.dropdownItems,
    required this.content,
  });

  @override
  State<_DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<_DashboardCard> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.dropdownItems.first;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.grey.shade50],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: widget.iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(widget.icon, color: widget.iconColor, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: DropdownButton<String>(
                value: selectedValue,
                isExpanded: true,
                underline: const SizedBox(),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: widget.dropdownItems
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ))
                    .toList(),
                onChanged: (newValue) =>
                    setState(() => selectedValue = newValue!),
              ),
            ),
            const SizedBox(height: 16),
            widget.content,
          ],
        ),
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const _StatusRow(this.label, this.count, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
            Text(label,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            count.toString(),
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: color),
          ),
        ),
      ],
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey)),
        Text(value,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87)),
      ],
    );
  }
}

class _MaintenanceRow extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const _MaintenanceRow(this.label, this.count, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(8)),
          child: Text(
            count.toString(),
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _ReportRow extends StatelessWidget {
  final String label;
  final String status;

  const _ReportRow(this.label, this.status);

  @override
  Widget build(BuildContext context) {
    final statusColor = status == 'Generated'
        ? Colors.green
        : status == 'In Progress'
            ? Colors.orange
            : Colors.red;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: statusColor.withOpacity(0.3)),
          ),
          child: Text(
            status,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500, color: statusColor),
          ),
        ),
      ],
    );
  }
}
