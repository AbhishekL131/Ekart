import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'address_model.dart';
import 'address_provider.dart';
import 'firebase_auth_methods.dart';
// Assuming you have an auth provider

class AddDeliveryAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController pincodeController = TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController houseDetailsController = TextEditingController();
    final TextEditingController areaController = TextEditingController();

    void _saveAddress() {
      if (nameController.text.isEmpty ||
          phoneNumberController.text.isEmpty ||
          pincodeController.text.isEmpty ||
          stateController.text.isEmpty ||
          cityController.text.isEmpty ||
          houseDetailsController.text.isEmpty ||
          areaController.text.isEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: Text("Error"),
            content: Text("All fields are required."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          ),
        );
      } else {
        final newAddress = Address(
          id: '',
          name: nameController.text,
          phoneNumber: phoneNumberController.text,
          pincode: pincodeController.text,
          state: stateController.text,
          city: cityController.text,
          houseDetails: houseDetailsController.text,
          area: areaController.text,
        );

        final userId = context.read<FirebaseAuthMethods>().user.uid;

        Provider.of<AddressProvider>(context, listen: false).addAddress(userId, newAddress);

        Navigator.pop(context);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Add delivery address",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 15),
              _buildTextField(controller: nameController, labelText: "Full Name (Required)"),
              SizedBox(height: 15),
              _buildTextField(
                controller: phoneNumberController,
                labelText: "Phone number (Required)",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Container(
                    width: 190,
                    child: _buildTextField(
                      controller: pincodeController,
                      labelText: "Pincode (Required)",
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: _buildTextField(controller: stateController, labelText: "State (Required)"),
                  ),
                  SizedBox(width: 15),
                  Flexible(
                    child: _buildTextField(controller: cityController, labelText: "City (Required)"),
                  ),
                ],
              ),
              SizedBox(height: 25),
              _buildTextField(controller: houseDetailsController, labelText: "House No., Building Name (Required)"),
              SizedBox(height: 25),
              _buildTextField(controller: areaController, labelText: "Road name, Area, Colony (Required)"),
              SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    "Address type",
                    style: TextStyle(
                      fontSize: 16
                    ),
                  )
                ],
              ),
              SizedBox(height: 40,),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saveAddress,
                  child: Text(
                    "Save Address",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueAccent, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
