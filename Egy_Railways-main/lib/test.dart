import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  final SupabaseClient supabase = Supabase.instance.client;
  List<dynamic> reservations = [];
  bool isLoading = true;

  @override
  void initState () {
    super.initState();
    fetchUserReservations();
  }

  Future<void> fetchUserReservations() async {
    final user = supabase.auth.currentUser;

    if (user != null) {
      final response = await supabase.from('reservations').select('*');
      

      setState(() {
        reservations = response;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حجوزاتك')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : reservations.isEmpty
              ? const Center(child: Text('لا يوجد حجوزات'))
              : ListView.builder(
                  itemCount: reservations.length,
                  itemBuilder: (context, index) {
                    final reservation = reservations[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text('رحلة يوم: ${reservation['date']}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('عدد الركاب: ${reservation['numPassengers']}'),
                            Text(
                                'السعر الإجمالي: ${reservation['totalPrice']} جنيه'),
                            Text('قطار رقم: ${reservation['trainId']}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
