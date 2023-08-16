import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project_getx/ui/screens/splash_screen.dart';
import 'package:task_manager_project_getx/ui/state_managers/add_new_task_controller.dart';
import 'package:task_manager_project_getx/ui/state_managers/email_verification_controller.dart';
import 'package:task_manager_project_getx/ui/state_managers/login_controller.dart';
import 'package:task_manager_project_getx/ui/state_managers/otp_verification_controller.dart';
import 'package:task_manager_project_getx/ui/state_managers/reset_password_controller.dart';
import 'package:task_manager_project_getx/ui/state_managers/signup_controller.dart';




class TaskManagerApp extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  const TaskManagerApp({super.key});

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: TaskManagerApp.globalKey,
      title: 'Task Manager Project With GetX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepPurple
      ),
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinding(),
      home: const SplashScreen(),
    );
  }
}

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<SignUpController>(SignUpController());
    Get.put<EmailVerificationController>(EmailVerificationController());
    Get.put<OtpVerificationController>(OtpVerificationController());
    Get.put<ResetPasswordController>(ResetPasswordController());
    Get.put<AddNewTaskController>(AddNewTaskController());
  }

}