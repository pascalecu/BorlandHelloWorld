unit Hello.IStatusCode;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  /// <summary>
  /// Interface representing a status code returned by operations.
  /// </summary>
  IStatusCode = interface
    ['{072CA0F4-DD20-4805-9E96-83DAD4A3C48A}']

    /// <summary>
    /// Retrieves the status code.
    /// </summary>
    /// <returns>
    /// An integer representing the status code, where 0 indicates success and any other value indicates an error.
    /// </returns>
    function GetStatusCode: integer;
  end;

implementation

end.
