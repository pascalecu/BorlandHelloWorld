unit Hello.IPrintStrategy;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Hello.IStatusCode, Hello.IHelloWorldString;

type
  /// <summary>
  /// Interface defining a print strategy with setup and print operations.
  /// </summary>
  IPrintStrategy = interface
    ['{2F31F143-666A-4B83-935D-165257EB6F45}']

    /// <summary>
    /// Prepares the print strategy for printing.
    /// </summary>
    /// <returns>
    /// An <c>IStatusCode</c> indicating success (0) or failure (non-zero).
    /// </returns>
    function SetupPrinting: IStatusCode;

    /// <summary>
    /// Prints the provided string using the implemented strategy.
    /// </summary>
    /// <param name="Str">The string to be printed, wrapped in <c>IHelloWorldString</c>.</param>
    /// <returns>
    /// An <c>IStatusCode</c> indicating success (0) or failure (non-zero).
    /// </returns>
    function Print(const Str: IHelloWorldString): IStatusCode;
  end;

implementation

end.
