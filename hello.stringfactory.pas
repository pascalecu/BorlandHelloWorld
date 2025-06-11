unit Hello.StringFactory;

{$mode ObjFPC}{$H+}

interface

uses
  Hello.HelloWorldString;

type
  /// <summary>
  /// Factory class for creating instances of <c>THelloWorldString</c>.
  /// Implements the singleton pattern.
  /// </summary>
  TStringFactory = class
  private
  class var FInstance: TStringFactory;

    /// <summary>
    /// Class constructor that initializes the singleton instance.
    /// </summary>
    class constructor Create;
  public
    /// <summary>
    /// Returns the singleton instance of <c>TStringFactory</c>.
    /// </summary>
    /// <returns>
    /// The singleton instance of <c>TStringFactory</c>.
    /// </returns>
    class function GetInstance: TStringFactory;

    /// <summary>
    /// Creates a new <c>THelloWorldString</c> with the given string value.
    /// </summary>
    /// <param name="Str">The string value to set in the <c>THelloWorldString</c>.</param>
    /// <returns>
    /// A newly created <c>THelloWorldString</c> instance with the specified value.
    /// </returns>
    function CreateHelloWorldString(const Str: string): THelloWorldString;
  end;

implementation

class constructor TStringFactory.Create;
begin
  FInstance := TStringFactory.Create;
end;

class function TStringFactory.GetInstance: TStringFactory;
begin
  Result := FInstance;
end;

function TStringFactory.CreateHelloWorldString(const Str: string): THelloWorldString;
begin
  Result := THelloWorldString.Create;
  Result.Value := Str;
end;

end.
