class Urls{
  Urls._();
  static const String baseUrl = 'https://task.teamrabbil.com/api/v1';
  static String registrationUrl = '$baseUrl/registration';
  static String loginUrl = '$baseUrl/login';
  static String createTaskUrl = '$baseUrl/createTask';
  static String taskStatusCountUrl = '$baseUrl/taskStatusCount';
  static String newTasksUrl = '$baseUrl/listTaskByStatus/New';
  static String cancelledTasksUrl = '$baseUrl/listTaskByStatus/Cancelled';
  static String inProgressTasksUrl = '$baseUrl/listTaskByStatus/Progress';
  static String completedTasksUrl = '$baseUrl/listTaskByStatus/Completed';
  static String deleteTasksUrl(String id) => '$baseUrl/deleteTask/$id';
  static String updateTaskStatusUrl(String id, String status) => '$baseUrl/updateTaskStatus/$id/$status';
  static String emailVerificationUrl(String email) => '$baseUrl/RecoverVerifyEmail/$email';
  static String otpVerificationUrl(String email, String otp) => '$baseUrl/RecoverVerifyOTP/$email/$otp';
  static String recoverPasswordResetUrl = '$baseUrl/RecoverResetPass';
  static String userProfileUpdateUrl = '$baseUrl/profileUpdate';
}