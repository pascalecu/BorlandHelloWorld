unit Hello.StatusCodeImplementation;

{$mode ObjFPC}{$H+}

interface

uses
  Hello.IStatusCode;

type
  /// <summary>
  /// Concrete implementation of the <c>IStatusCode</c> interface.
  /// Represents a status code with an integer value.
  /// </summary>
  TStatusCodeImplementation = class(TInterfacedObject, IStatusCode)
  private
    FCode: integer;
  public
    /// <summary>
    /// Creates an instance of <c>TStatusCodeImplementation</c> with the specified status code.
    /// </summary>
    /// <param name="ACode">The integer status code to store.</param>
    constructor Create(ACode: integer);

    /// <summary>
    /// Retrieves the stored status code.
    /// </summary>
    /// <returns>The integer status code.</returns>
    function GetStatusCode: integer;
  end;

implementation

constructor TStatusCodeImplementation.Create(ACode: integer);
begin
  inherited Create;
  FCode := ACode;
end;

function TStatusCodeImplementation.GetStatusCode: integer;
begin
  Result := FCode;
end;

end.
