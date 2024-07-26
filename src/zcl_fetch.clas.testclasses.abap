*"* use this source file for your ABAP unit test classes
class ltcl_fetch definition final for testing inheriting from zcl_assert
  duration short
  risk level harmless.

  private section.
    methods:
      by_url for testing raising cx_static_check,
      by_url_and_path for testing raising cx_static_check,
      by_url_and_path2 for testing raising cx_static_check,
      by_url_and_path3 for testing raising cx_static_check.

    methods check_swagger_json_response importing response type ref to zif_fetch_response raising cx_static_check.
endclass.


class ltcl_fetch implementation.

  " fetch by URL
  method by_url.
    data(lo_response) = zcl_fetch=>by_url( 'https://petstore.swagger.io/v2/swagger.json' )->fetch(  ).
    check_swagger_json_response( lo_response ).
  endmethod.

  " fetch by URL and relative path
  method by_url_and_path.
    data(lo_response) = zcl_fetch=>by_url( 'https://petstore.swagger.io/v2/' )->fetch( 'swagger.json' ).
    check_swagger_json_response( lo_response ).
  endmethod.

  " fetch by URL and relative path, but no ending / for URL
  method by_url_and_path2.
    data(lo_response) = zcl_fetch=>by_url( 'https://petstore.swagger.io/v2' )->fetch( 'swagger.json' ).
    check_swagger_json_response( lo_response ).
  endmethod.

  " fetch by URL and absolute path
  " should replace path withing host
  method by_url_and_path3.
    data(lo_response) = zcl_fetch=>by_url( 'https://petstore.swagger.io/v2' )->fetch( '/v2/swagger.json' ).
    check_swagger_json_response( lo_response ).
  endmethod.

  method check_swagger_json_response.
    assert( response->status( ) )->eq( 200 ).
    assert( response->body( ) )->not_initial( ).
    assert( response->text( ) )->not_initial( ).
    assert( response->header( 'Content-Type' ) )->eq( 'application/json' ).
  endmethod.

endclass.
