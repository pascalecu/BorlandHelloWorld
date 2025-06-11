unit Hello.IHelloWorld;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,
  Hello.IHelloWorldString,
  Hello.IPrintStrategy,
  Hello.IStatusCode;

type

  /// <summary>
  /// Interface representing the core Hello World functionality.
  /// </summary>
  IHelloWorld = interface
    ['{972D0066-E509-480C-B266-A9954F85E06F}']

    /// <summary>
    /// Retrieves the Hello World string object.
    /// </summary>
    /// <returns>
    /// An instance of <see cref="IHelloWorldString"/> containing the Hello World text.
    /// </returns>
    function GetHelloWorldString: IHelloWorldString;

    /// <summary>
    /// Retrieves the print strategy to output the Hello World string.
    /// </summary>
    /// <returns>
    /// An instance of <see cref="IPrintStrategy"/> to handle printing.
    /// </returns>
    function GetPrintStrategy: IPrintStrategy;

    /// <summary>
    /// Prints the Hello World string using the specified print strategy.
    /// </summary>
    /// <param name="Strategy">
    /// The print strategy to use.
    /// </param>
    /// <param name="Str">
    /// The Hello World string object to print.
    /// </param>
    /// <returns>
    /// An instance of <see cref="IStatusCode"/> representing the success or failure status.
    /// </returns>
    function Print(const Strategy: IPrintStrategy;
      const Str: IHelloWorldString): IStatusCode;
  end;

implementation

end.
