unit Hello.HelloWorldString;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  /// <summary>
  /// Class that encapsulates a HelloWorld string value.
  /// </summary>
  THelloWorldString = class
  private
    FString: string;
  public
    /// <summary>
    /// Gets or sets the HelloWorld string value.
    /// </summary>
    property Value: string read FString write FString;

    /// <summary>
    /// Returns the stored HelloWorld string.
    /// </summary>
    /// <returns>A <see cref="string"/> representing the HelloWorld message.</returns>
    function GetHelloWorldString: string;
  end;

implementation

function THelloWorldString.GetHelloWorldString: string;
begin
  Result := FString;
end;

end.
