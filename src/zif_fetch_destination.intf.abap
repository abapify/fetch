interface zif_fetch_destination
  public .

  types:
      destination_type type string.

  constants:

     begin of destination_types,
        url type destination_type value zif_fetch_destination_url=>type,
        rfc type destination_type value zif_fetch_destination_rfc=>type,
     end of destination_types.

   data type type destination_type read-only.


endinterface.
