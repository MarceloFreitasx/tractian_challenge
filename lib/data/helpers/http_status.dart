enum HttpStatus {
  /// Success request
  /// Status Code: 200
  success,

  /// This response means that the server did not understand the request
  /// because it has an invalid syntax.
  /// Status Code: 400
  badRequest,

  /// Access token is missing or invalid or expired or user is not authenticated
  /// Status Code: 401
  unauthenticated,

  /// The client is authenticated but doesn't have permission to access the resource.
  /// Status Code: 403
  forbidden,

  /// Item that you are looking for is not available for specific range
  /// Status Code: 404
  notFound,

  /// Data submitted was not correct (Validation errors)
  /// Status Code: 422
  unprocessableEntity,

  /// It can be some issue from server side
  /// Status Code: 500
  unexpected,
}
