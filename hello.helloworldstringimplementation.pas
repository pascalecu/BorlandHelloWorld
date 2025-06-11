unit Hello.HelloWorldStringImplementation;

{$mode ObjFPC}{$H+}

interface

uses
  Hello.IHelloWorldString,
  Hello.HelloWorldString,
  Hello.StringFactory;

type
  /// <summary>
  /// Implementation of the <c>IHelloWorldString</c> interface.
  /// Provides a HelloWorld string instance.
  /// </summary>
  THelloWorldStringImplementation = class(TInterfacedObject, IHelloWorldString)
  public
    /// <summary>
    /// Retrieves a <c>THelloWorldString</c> instance containing the "Hello, World!" message.
    /// </summary>
    /// <returns>
    /// A <c>THelloWorldString</c> instance with the HelloWorld text.
    /// </returns>
    function GetHelloWorldString: THelloWorldString;
  end;

implementation

function THelloWorldStringImplementation.GetHelloWorldString: THelloWorldString;
var
  Factory: TStringFactory;
begin
  Factory := TStringFactory.GetInstance;
  Result := Factory.CreateHelloWorldString('Hello, World!');
end;

end.
