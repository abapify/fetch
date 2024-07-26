# Fetch polyfill

ABAP [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)-like implementation

## Why do we need polyfill?
We used use `cl_http_client` during long time in our leagcy code. However currently this class is not released for usage in ABAP Cloud. At the same time classes which we use in the cloud such as `cl_http_destination_provider` or `cl_web_http_client_manager` are not available in legacy systems ( Let's say ECC ).

So in few words we face a problem that same code should be written differently in different systems. So this project delivers the idea to have just one truly minimalistic facade which can plug-in different release-specific implementations.

## The concept

Let's make it possible to call something like this which will work in any system
```abap
data(response) = zcl_fetch=>by_url( 'https://petstore.swagger.io/v2/' )->fetch( 'swagger.json' ).
assert( response->status )->eq( 200 ).
assert( response->body( ) )->not_initial( ).
assert( response->text( ) )->not_initial( ).
assert( response->header( 'Content-Type' ) )->eq( 'application/json' ).
```

## Plugins

- [Cloud fetch](https://github.com/abapify/fetch-cloud)
- [Legacy fetch](https://github.com/abapify/fetch-legacy)


## Other Dependencies
- [assert](https://github.com/abapify/assert) - unit test assertions
- [throw](https://github.com/abapify/throw) - throw an object as exception

## Alternative solutions
- https://github.com/open-abap/cross-http-client by @larshp. WIP

