unit Hello.HelloWorld;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,
  Hello.IHelloWorld,
  Hello.IHelloWorldString,
  Hello.IPrintStrategy,
  Hello.IStatusCode,
  Hello.EPrintStrategyError,
  Hello.HelloWorldFactory;

type
  /// <summary>
  /// Represents the core Hello World application logic.
  /// </summary>
  THelloWorld = class
    /// <summary>
    /// Initializes a new instance of the <c>THelloWorld</c> class and
    /// executes the print strategy.
    /// </summary>
    /// <exception cref="EPrintStrategyError">
    /// Raised if printing fails due to a non-zero status code returned by the
    /// print strategy.
    /// </exception>
    constructor Create;
  end;

implementation

constructor THelloWorld.Create;
var
  Factory: THelloWorldFactory;
  HelloWorld: IHelloWorld;
  HelloString: IHelloWorldString;
  Strategy: IPrintStrategy;
  Code: IStatusCode;
begin
  Factory := THelloWorldFactory.GetInstance;
  HelloWorld := Factory.CreateHelloWorld;
  HelloString := HelloWorld.GetHelloWorldString;
  Strategy := HelloWorld.GetPrintStrategy;
  Code := HelloWorld.Print(Strategy, HelloString);

  if Code.GetStatusCode <> 0 then
    raise EPrintStrategyError.CreateFmt('Failed to print: [HW%d]', [Code.GetStatusCode]);
end;


end.
