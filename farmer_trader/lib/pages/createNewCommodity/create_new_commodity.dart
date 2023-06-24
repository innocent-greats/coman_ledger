import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commodity_man/theme/theme.dart';

class CreateNewCommodity extends StatelessWidget {
  CreateNewCommodity({super.key});
  final TextEditingController imageUrlController = TextEditingController();

  final TextEditingController assetTypeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController speciesController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Add New Commodity",
          style: appBarStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2.0),
        children: [
          // heightSpace,
          // heightSpace,
          // userProfileImage(size, context),
          heightSpace,
          heightSpace,
          assetTypeField(),
          heightSpace,
          heightSpace,
          nameField(),
          heightSpace,
          heightSpace,
          categoryField(),
          heightSpace,
          heightSpace,
          speciesField(),
          heightSpace,
          heightSpace,
          weightField(),
          heightSpace,
          heightSpace,
          descriptionField(),
          heightSpace,
          heightSpace,
          locationField(),
          heightSpace,
          heightSpace,
        ],
      ),
      bottomNavigationBar: saveButton(size, context),
    );
  }

  assetTypeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Commodity Category",
          style: semibold15Grey,
        ),
        TextField(
          controller: nameController,
          keyboardType: TextInputType.name,
          cursorColor: primaryColor,
          style: bold16Black,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "What is the commodity name",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lightGreyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  nameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Common Name",
          style: semibold15Grey,
        ),
        TextField(
          controller: nameController,
          keyboardType: TextInputType.name,
          cursorColor: primaryColor,
          style: bold16Black,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "What is the commodity name",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lightGreyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  categoryField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Category",
          style: semibold15Grey,
        ),
        TextField(
          controller: assetTypeController,
          keyboardType: TextInputType.text,
          cursorColor: primaryColor,
          style: bold16Black,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "category",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lightGreyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  speciesField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Species",
          style: semibold15Grey,
        ),
        TextField(
          controller: speciesController,
          keyboardType: TextInputType.text,
          cursorColor: primaryColor,
          style: bold16Black,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Enter species",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lightGreyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  weightField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Weight",
          style: semibold15Grey,
        ),
        TextField(
          obscureText: true,
          controller: weightController,
          keyboardType: TextInputType.text,
          cursorColor: primaryColor,
          style: bold16Black,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Enter weight",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lightGreyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  locationField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Pickup Location",
          style: semibold15Grey,
        ),
        TextField(
          obscureText: true,
          controller: weightController,
          keyboardType: TextInputType.text,
          cursorColor: primaryColor,
          style: bold16Black,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Enter weight",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lightGreyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  descriptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style: semibold15Grey,
        ),
        TextField(
          obscureText: true,
          controller: descriptionController,
          keyboardType: TextInputType.visiblePassword,
          cursorColor: primaryColor,
          style: bold16Black,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Enter description",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lightGreyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  userProfileImage(Size size, BuildContext context) {
    return Center(
      child: SizedBox(
        height: size.height * 0.125,
        width: size.height * 0.12,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.12,
              width: size.height * 0.12,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
                image: DecorationImage(
                  image: AssetImage("assets/CreateNewCommodity/User.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 3,
              child: InkWell(
                onTap: () {
                  chnageProfilePhotoSheet(context);
                },
                child: Container(
                  height: size.height * 0.04,
                  width: size.height * 0.04,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: blackColor.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: primaryColor,
                    size: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  chnageProfilePhotoSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(fixPadding * 2.0),
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              const Text(
                "Choose Option",
                style: bold18Black,
              ),
              heightSpace,
              imageChageOption(context, "Use Camera", Icons.camera_alt),
              heightSpace,
              heightSpace,
              imageChageOption(context, "Upload from Gallery", Icons.image),
              heightSpace,
              heightSpace,
              imageChageOption(
                  context, "Remove Photo", CupertinoIcons.delete_solid),
            ],
          ),
        );
      },
    );
  }

  imageChageOption(BuildContext context, String text1, IconData icon) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: greyShade3,
            size: 20,
          ),
          widthSpace,
          widthSpace,
          Expanded(
            child: Text(
              text1,
              style: semibold15Grey,
            ),
          )
        ],
      ),
    );
  }

  saveButton(Size size, context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(
                  top: fixPadding * 1.5,
                  bottom: fixPadding * 2.0,
                  left: fixPadding * 2.0,
                  right: fixPadding * 2.0),
              padding: const EdgeInsets.all(fixPadding * 1.3),
              width: size.width * 0.75,
              decoration: BoxDecoration(
                  boxShadow: buttonShadow,
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(5.0)),
              child: const Text(
                "Next",
                style: bold18White,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
