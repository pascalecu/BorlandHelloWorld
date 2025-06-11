unit Hello.PrintStrategyImplementation;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,
  Hello.IPrintStrategy,
  Hello.IHelloWorldString,
  Hello.IStatusCode,
  Hello.StatusCodeImplementation;

type
  /// <summary>
  /// Implementation of the <c>IPrintStrategy</c> interface that writes output to a stream.
  /// </summary>
  TPrintStrategyImplementation = class(TInterfacedObject, IPrintStrategy)
  private
    /// <summary>
    /// Stream used for output, typically connected to standard output.
    /// </summary>
    FPrintStream: TStream;
  public
    /// <summary>
    /// Initializes a new instance of the <c>TPrintStrategyImplementation</c> class.
    /// </summary>
    constructor Create;

    /// <summary>
    /// Cleans up the instance and releases resources.
    /// </summary>
    destructor Destroy; override;

    /// <summary>
    /// Sets up the printing environment, initializing required resources.
    /// </summary>
    /// <returns>An <c>IStatusCode</c> indicating success (0) or error codes.</returns>
    function SetupPrinting: IStatusCode;

    /// <summary>
    /// Prints the given hello world string using the configured print stream.
    /// </summary>
    /// <param name="AString">The hello world string interface instance to print.</param>
    /// <returns>An <c>IStatusCode</c> indicating success (0) or error codes.</returns>
    function Print(const AString: IHelloWorldString): IStatusCode;
  end;

implementation

constructor TPrintStrategyImplementation.Create;
begin
  inherited Create;
  FPrintStream := nil;
end;

destructor TPrintStrategyImplementation.Destroy;
begin
  FPrintStream.Free;
  inherited Destroy;
end;

function TPrintStrategyImplementation.SetupPrinting: IStatusCode;
begin
  try
    FPrintStream := THandleStream.Create(StdOutputHandle);
    Result := TStatusCodeImplementation.Create(0);
  except
    on E: Exception do
      Result := TStatusCodeImplementation.Create(9974);
  end;
end;

function TPrintStrategyImplementation.Print(
  const AString: IHelloWorldString): IStatusCode;
var
  OutputStr: rawbytestring;
  BytesWritten: nativeint;
begin
  try
    OutputStr := UTF8Encode(AString.GetHelloWorldString.GetHelloWorldString +
      sLineBreak);

    BytesWritten := FPrintStream.Write(OutputStr[1], Length(OutputStr));

    if BytesWritten = Length(OutputStr) then
      Result := TStatusCodeImplementation.Create(0)
    else
      Result := TStatusCodeImplementation.Create(2746);
  except
    on E: Exception do
      Result := TStatusCodeImplementation.Create(5231);
  end;
end;

end.
