// TODO Implement this library.
// TODO Implement this library.
class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure([this.message = "Có lỗi xảy ra"]);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    // switch (code) {
    //   case 'weak-password':
    //     return const SignUpWithEmailAndPasswordFailure(
    //         "Chọn một mật khẩu mạnh hơn");
    //   case 'invalid-email':
    //     return const SignUpWithEmailAndPasswordFailure(
    //         "Email không tồn tại hoặc sai định dạng");
    //   case 'email-already-in-use':
    //     return const SignUpWithEmailAndPasswordFailure(
    //         "Email đã được đăng ký với một tài khoản khác");
    //   case 'operation-not-allowed':
    //     return const SignUpWithEmailAndPasswordFailure(
    //         "Không được cho phép. Liên hệ để thêm thông tin");
    //   default:
    return const LogInWithEmailAndPasswordFailure();
    // }
  }
}
