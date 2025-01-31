class Strings {
  // Private constructor
  Strings._();

  // Factory constructor
  factory Strings() {
    return Strings._();
  }

  //appName
  static get appName => 'Portfolio';

  static get signIn => 'Sign In';
  static get userName => 'User Name';
  static get userMobileNumber => 'User Mobile Number';
  static get userEmailId => 'User Email ID';
  static get userPassword => 'User Password';
  static get confirmPassword => 'Confirm Password';

  //Status Codes
  static get requestSuccess => 'Request successful.';
  static get resourceCreatedSuccess => 'Resource created successfully.';
  static get noContent => 'No content.';
  static get badRequest => 'Bad request. Please check your input.';
  static get unauthorized => 'Unauthorized. Please log in.';
  static get forbidden => 'Forbidden. You do not have permission to access this resource.';
  static get resourceNotFound => 'Resource not found.';
  static get methodNotAllowed => 'Method not allowed.';
  static get requestTimeOut => 'Request timeout. Please try again.';
  static get tooManyRequests => 'Too many requests. Please wait and try again.';
  static get internalServerError => 'Internal server error. Please try again later.';
  static get badGateway => 'Bad gateway. The server is unavailable.';
  static get serviceUnavailable => 'Service unavailable. Please try again later.';
  static get gatewayTimeOut => 'Gateway timeout. The server did not respond in time.';
  static get unexpectedError => 'Unexpected error. Please try again.';
  //error details
  static get connectionTimeOut => 'Connection timed out. Please check your network connection.';
  static get responseTimeOut => 'Response timed out. Please try again later.';
  static get requestTimeOuts => 'Request timed out. Please check your network and try again.';
  static get requestWasCanceled => 'Request was canceled. Please try again.';
  static get anErrorOccurred => 'An unknown error occurred. Please try again.';
  static get apiKeyPart => 'f8O7V7H/jFgZ/YohIZ6rlw=';
  static get apiVersion => 'v1/';
}