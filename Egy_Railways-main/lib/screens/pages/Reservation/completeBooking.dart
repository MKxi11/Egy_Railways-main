import 'package:egyrailwayes/constants/bar.dart';
import 'package:egyrailwayes/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Completebooking extends StatefulWidget {
  final Map<String, dynamic> train;

  const Completebooking({super.key, required this.train});

  @override
  State<Completebooking> createState() => _CompletebookingState();
}

class _CompletebookingState extends State<Completebooking> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _passengersController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final supabase = Supabase.instance.client;
  List<dynamic> reservations = [];
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final int stops = int.tryParse(widget.train['stopin'].toString()) ?? 0;
    final int price = stops * 30;

    Future<List<dynamic>> fetchUsers() async {
      final response = await Supabase.instance.client
          .from('reservations')
          .select("*")
          .order('created_at', ascending: false);
      return response;
    }

    Future<void> fetchReservations() async {
      final response = await supabase.from('reservations').select('*');

      @override
      void initState() {
        super.initState();
        fetchReservations();
      }

      if (mounted) {
        setState(() {
          reservations = response;
        });
      }
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Bar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // العنوان وزر الرجوع
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 0, right: 2),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Complete your\nBooking',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.sp),
                              ),
                              Text(
                                'Please fill in your details \nto complete the booking',
                                style: TextStyle(fontSize: 14.sp),
                              )
                            ],
                          ),
                          InkWell(
                              child: Container(
                                  width: 90.w,
                                  height: 55.h,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(60, 41, 161, 212),
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.arrow_back),
                                      Text('Back to\n search'),
                                    ],
                                  )),
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => test())))
                        ])),
                // فورم البيانات
                Container(
                  height: 610.h,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color.fromARGB(
                            25, 41, 161, 212), // Transparent blue
                        Colors.white, // White
                      ],
                      stops: [
                        0.0,
                        0.2
                      ], // Adjust the stops for the gradient effect
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Passenger Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.sp),
                          ),
                          Text(
                            "Enter your personal information",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                      Spacer(),

                      _buildTextField(
                          label: Supabase.instance.client.auth.currentUser
                                  ?.userMetadata?['full_name']
                                  ?.split(" ")
                                  .first ??
                              "No First Name",
                          hint: 'Enter your first name',
                          icon: Icons.person),
                      _buildTextField(
                          label: Supabase.instance.client.auth.currentUser
                                  ?.userMetadata?['full_name']
                                  ?.split(" ")
                                  .last ??
                              "No First Name",
                          hint: 'Enter your last name',
                          icon: Icons.person),
                      _buildTextField(
                        label: 'Number of Passengers',
                        hint: 'Enter number of passengers',
                        icon: Icons.people,
                        keyboardType: TextInputType.number,
                        controller: _passengersController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the number of passengers';
                          }
                          return null;
                        },
                      ),
                      _buildTextField(
                          label: 'Email',
                          hint: 'Enter your email',
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress),
                      _buildTextField(
                        label: 'Phone Number',
                        hint: 'Enter your phone number',
                        icon: Icons.phone,
                        prefixText: '+20 ',
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),

                      /// ⬇ فيلد تاريخ السفر المعدل
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: TextFormField(
                          controller: _dateController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Date of Travel',
                            hintText: 'Select your travel date',
                            prefixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onTap: () async {
                            DateTime now = DateTime.now();
                            DateTime tomorrow = now.add(Duration(days: 1));

                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: tomorrow,
                              firstDate: tomorrow,
                              lastDate: DateTime(now.year + 1),
                            );

                            if (pickedDate != null) {
                              String formattedDate =
                                  "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                              setState(() {
                                _dateController.text = formattedDate;
                              });
                            }
                          },
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Container(
                  height: 360.h,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color.fromARGB(
                            25, 41, 161, 212), // Transparent blue
                        Colors.white, // White
                      ],
                      stops: [
                        0.0,
                        0.2
                      ], // Adjust the stops for the gradient effect
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Payment Information",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.sp),
                          ),
                          Text(
                            "Enter your card details securely",
                            style: TextStyle(fontSize: 14.sp),
                          )
                        ],
                      ),
                      Spacer(),
                      _buildTextField(
                        label: 'Card Number',
                        hint: 'Enter your card number',
                        icon: Icons.credit_card,
                        keyboardType: TextInputType.number,
                      ),
                      _buildTextField(
                        label: 'Cardholder Name',
                        hint: 'Enter cardholder name',
                        icon: Icons.person,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              label: 'Expiry Date',
                              hint: 'MM/YY',
                              icon: Icons.calendar_month,
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: _buildTextField(
                              label: 'CVV',
                              hint: 'Enter CVV',
                              icon: Icons.lock,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Container(
                    height: 330.h,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color.fromARGB(
                              25, 41, 161, 212), // Transparent blue
                          Colors.white, // White
                        ],
                        stops: [
                          0.0,
                          0.2
                        ], // Adjust the stops for the gradient effect
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Booking summary",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.sp),
                            ),
                            Text(
                              "Review your booking details",
                              style: TextStyle(fontSize: 14.sp),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Train',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Container(
                                    width: 80.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          60, 41, 161, 212),
                                      borderRadius:
                                          BorderRadius.circular(20.0.r),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: widget.train['level'] != null
                                          ? Text(
                                              "${widget.train['level']}",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                color: const Color.fromARGB(
                                                    255, 49, 73, 117),
                                              ),
                                              textAlign: TextAlign.center,
                                            )
                                          : SizedBox(
                                              height: 20,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.train['trainFrom']} ",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: const Color.fromARGB(
                                            255, 86, 86, 86)),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 18.sp,
                                    color:
                                        const Color.fromARGB(255, 86, 86, 86),
                                  ),
                                  Text(
                                    " ${widget.train['trainTo']} ",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: const Color.fromARGB(
                                            255, 86, 86, 86)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    " ${widget.train['go']} - ",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: const Color.fromARGB(
                                            255, 86, 86, 86)),
                                  ),
                                  Text(
                                    " ${widget.train['arrive']} ",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: const Color.fromARGB(
                                            255, 86, 86, 86)),
                                  ),
                                  Text(
                                    " (${widget.train['time']} Hours)  ",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: const Color.fromARGB(
                                            255, 86, 86, 86)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    " ${0} passenger ",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: const Color.fromARGB(
                                            255, 86, 86, 86)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }

  // ويدجت مساعدة لبناء الفيلدات
  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    String? prefixText,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixText: prefixText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }
}
