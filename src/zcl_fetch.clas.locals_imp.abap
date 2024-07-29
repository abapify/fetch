*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations


class lcl_fetch_delegate definition inheriting from zcl_fetch_delegate.
  public section.
  methods client redefinition.
  protected section.
endclass.

class lcl_fetch_delegate implementation.
  method client.
    result = destination->client( ).
  endmethod.
endclass.
