unit Hello.HelloWorldImplementation;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Hello.IHelloWorld, Hello.IPrintStrategy,
  Hello.IStatusCode, Hello.IHelloWorldString, Hello.HelloWorldStringImplementation,
  Hello.PrintStrategyFactory;

type
  /// <summary>
  /// Concrete implementation of the <c>IHelloWorld</c> interface.
  /// Provides access to HelloWorldString and PrintStrategy,
  /// and performs printing operations.
  /// </summary>
  THelloWorldImplementation = class(TInterfacedObject, IHelloWorld)
  public
    /// <summary>
    /// Returns an <c>IHelloWorldString</c> instance containing the "Hello, World!" string.
    /// </summary>
    /// <returns>An instance implementing <c>IHelloWorldString</c>.</returns>
    function GetHelloWorldString: IHelloWorldString;

    /// <summary>
    /// Returns a configured <c>IPrintStrategy</c> instance for printing.
    /// </summary>
    /// <returns>An instance implementing <c>IPrintStrategy</c>.</returns>
    function GetPrintStrategy: IPrintStrategy;

    /// <summary>
    /// Executes printing of the given string using the specified print strategy.
    /// </summary>
    /// <param name="Strategy">The print strategy to use.</param>
    /// <param name="Str">The string to print.</param>
    /// <returns>An <c>IStatusCode</c> indicating success or failure of the print operation.</returns>
    function Print(const Strategy: IPrintStrategy;
      const Str: IHelloWorldString): IStatusCode;
  end;

implementation

function THelloWorldImplementation.GetHelloWorldString: IHelloWorldString;
begin
  Result := THelloWorldStringImplementation.Create;
end;

function THelloWorldImplementation.GetPrintStrategy: IPrintStrategy;
var
  Factory: TPrintStrategyFactory;
begin
  Factory := TPrintStrategyFactory.GetInstance;
  Result := Factory.CreatePrintStrategy;
end;

function THelloWorldImplementation.Print(const Strategy: IPrintStrategy;
  const Str: IHelloWorldString): IStatusCode;
begin
  Result := Strategy.Print(Str);
end;

end.
