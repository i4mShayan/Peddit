import 'libs.dart';

bool isEmailValid(String email){
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

bool isPasswordValid(String password){
  return RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$").hasMatch(password);
}

String? passwordError(TextEditingController _password){
  return _password.text.isEmpty ? "Password can't be empty!" : (!isPasswordValid(_password.text) ? 'Minimum length of password must be 8\n'
      'and should have at least 1 Uppercase,\n1 Lowercase and 1 Number' : null);
}

String? emailError(TextEditingController _email){
  return _email.text.isEmpty ? "Email can't be empty!" : (!isEmailValid(_email.text) ? 'Enter email correctly' : null);
}

String? usernameError(TextEditingController _username){
  return _username.text.isEmpty ? "Username can't be empty!" : null;
}

bool signupHasError(TextEditingController _email, TextEditingController _username, TextEditingController _password){
  return (usernameError(_username)!=null || emailError(_email)!=null || passwordError(_password)!=null);
}

bool userAdminOf(UserModel user, ForumModel forum){
  return forum.admins.contains(user) || forum.owner==user;
}

bool userCanDeletePost( UserModel user, PostModel post,){
  return post.publisher==user || userAdminOf(user, post.forum);
}

void deletePost(PostModel post){
  post.forum.posts.remove(post);
  Datas().updateFeed();
}