import 'package:e_commerce_app_flutter/components/default_button.dart';
import 'package:e_commerce_app_flutter/models/Address.dart';
import 'package:e_commerce_app_flutter/services/database/user_database_helper.dart';
import 'package:e_commerce_app_flutter/size_config.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../../../constants.dart';

class AddressDetailsForm extends StatefulWidget {
  AddressDetailsForm({
    Key key,
  }) : super(key: key);

  @override
  _AddressDetailsFormState createState() => _AddressDetailsFormState();
}

class _AddressDetailsFormState extends State<AddressDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleFieldController = TextEditingController();

  final TextEditingController receiverFieldController = TextEditingController();

  final TextEditingController addressLine1FieldController =
      TextEditingController();

  final TextEditingController addressLine2FieldController =
      TextEditingController();

  final TextEditingController cityFieldController = TextEditingController();

  final TextEditingController districtFieldController = TextEditingController();

  final TextEditingController stateFieldController = TextEditingController();

  final TextEditingController landmarkFieldController = TextEditingController();

  final TextEditingController pincodeFieldController = TextEditingController();

  final TextEditingController phoneFieldController = TextEditingController();

  @override
  void dispose() {
    titleFieldController.dispose();
    receiverFieldController.dispose();
    addressLine1FieldController.dispose();
    addressLine2FieldController.dispose();
    cityFieldController.dispose();
    stateFieldController.dispose();
    districtFieldController.dispose();
    landmarkFieldController.dispose();
    pincodeFieldController.dispose();
    phoneFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          buildTitleField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildReceiverField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressLine1Field(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressLine2Field(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCityField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDistrictField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildStateField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLandmarkField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPincodeField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Save Address",
            press: saveAddressButtonCallback,
          ),
        ],
      ),
    );
  }

  Widget buildTitleField() {
    return TextFormField(
      controller: titleFieldController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Enter a title for address",
        labelText: "Title",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildReceiverField() {
    return TextFormField(
      controller: receiverFieldController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Enter Full Name of Receiver",
        labelText: "Receiver Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildAddressLine1Field() {
    return TextFormField(
      controller: addressLine1FieldController,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        hintText: "Enter Address Line No. 1",
        labelText: "Address Line 1",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildAddressLine2Field() {
    return TextFormField(
      controller: addressLine2FieldController,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        hintText: "Enter Address Line No. 2",
        labelText: "Address Line 2",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildCityField() {
    return TextFormField(
      controller: cityFieldController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Enter City",
        labelText: "City",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildDistrictField() {
    return TextFormField(
      controller: districtFieldController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Enter District",
        labelText: "District",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildStateField() {
    return TextFormField(
      controller: stateFieldController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Enter State",
        labelText: "State",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildPincodeField() {
    return TextFormField(
      controller: pincodeFieldController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Enter PINCODE",
        labelText: "PINCODE",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return FIELD_REQUIRED_MSG;
        } else if (!isNumeric(value)) {
          return "Only digits field";
        } else if (value.length != 6) {
          return "PINCODE must be of 6 Digits only";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildLandmarkField() {
    return TextFormField(
      controller: landmarkFieldController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Enter Landmark",
        labelText: "Landmark",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildPhoneField() {
    return TextFormField(
      controller: phoneFieldController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: "Enter Phone Number",
        labelText: "Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return FIELD_REQUIRED_MSG;
        } else if (value.length != 10) {
          return "Only 10 Digits";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Future<void> saveAddressButtonCallback() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final Address newAddress = Address(
        title: titleFieldController.text,
        receiver: receiverFieldController.text,
        addresLine1: addressLine1FieldController.text,
        addressLine2: addressLine2FieldController.text,
        city: cityFieldController.text,
        district: districtFieldController.text,
        state: stateFieldController.text,
        landmark: landmarkFieldController.text,
        pincode: pincodeFieldController.text,
        phone: phoneFieldController.text,
      );
      String status =
          await UserDatabaseHelper().addAddressForCurrentUser(newAddress);
      if (status == UserDatabaseHelper.NEW_ADDRESS_ADDED_SUCCESSFULLY) {
        print("New Address added successfully");
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("New Address added successfully")));
        Navigator.pop(context);
      } else {
        print("Exception result: $status");
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Something went wrong")));
      }
    }
  }
}
