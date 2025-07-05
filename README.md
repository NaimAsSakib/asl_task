# ASL Task Flutter Project

This is a Flutter application developed as part of the **ASL Task** project.

---

## Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone https://github.com/NaimAsSakib/asl_task.git
   
# Install Dependencies
flutter pub get
# Run the Application
flutter run
# Configure FVM (Optional but Recommended)
This project uses FVM (Flutter Version Management) to manage Flutter versions consistently.
# Install FVM:
dart pub global activate fvm
# Install the desired Flutter version:
fvm install 3.32.5
fvm use 3.32.5
or
C:\Users\ASUS\AppData\Local\Pub\Cache\bin\fvm global 3.32.5 [N.B: change path with yours]
Make sure your IDE uses the FVM-managed SDK.

# State Management
This project uses GetX for state management, navigation, and dependency injection.

Key benefits:
Simple reactive state updates (Obx, GetBuilder).
Built-in navigation without context.
Dependency injection via Get.put() and Get.find().

# Migration Approach
Flutter version migration is handled using FVM to avoid conflicts with global Flutter SDKs.
This allows all developers to work on the same Flutter version regardless of their local installations.

Common Commands
Install a specific Flutter version:
fvm install <version>
Use a specific version in the project:
fvm use <version>
Upgrade Flutter globally (if not using FVM):
flutter upgrade/fvm global <desired version>
Detailed migration instructions are documented in Migration.md.

# Bonus task
Sorry! As I couldn't complete as I am very busy with my official deadlines and family dependencies. 
