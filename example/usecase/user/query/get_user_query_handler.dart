// Define query handler
import 'package:cmdr/cmdr.dart';

import '../user.dart';
import 'get_user_query.dart';

class GetUserQueryHandler extends QueryHandler<GetUserQuery, User> {
  Future<User> handle(GetUserQuery query) async {
    // Query handling logic to get user details
    print('Fetching user details for user ID: ${query.userId}');
    // Simulated asynchronous operation
    await Future.delayed(Duration(seconds: 1));
    // Return a dummy user object
    return User(query.userId, 'John Doe', 'john@example.com');
  }
}
