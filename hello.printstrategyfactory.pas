unit Hello.PrintStrategyFactory;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,
  Hello.IPrintStrategy, Hello.IStatusCode,
  Hello.EPrintStrategyError,
  Hello.PrintStrategyImplementation, syncobjs;

type
  /// <summary>
  /// Factory class responsible for creating instances of <c>IPrintStrategy</c>.
  /// Implements thread-safe singleton pattern.
  /// </summary>
  TPrintStrategyFactory = class
  private
    /// <summary>
    /// Singleton instance of the factory.
    /// </summary>
  class var FInstance: TPrintStrategyFactory;

    /// <summary>
    /// Synchronization object to protect singleton creation.
    /// </summary>
  class var FLock: TCriticalSection;
  public
    /// <summary>
    /// Returns the singleton instance of the factory.
    /// </summary>
    /// <returns>The singleton <c>TPrintStrategyFactory</c> instance.</returns>
    class function GetInstance: TPrintStrategyFactory;

    /// <summary>
    /// Creates and initializes a new <c>IPrintStrategy</c> instance.
    /// </summary>
    /// <returns>A ready-to-use <c>IPrintStrategy</c> instance.</returns>
    /// <exception cref="EPrintStrategyError">Raised if the strategy setup fails.</exception>
    function CreatePrintStrategy: IPrintStrategy;

    /// <summary>
    /// Class constructor initializes synchronization resources.
    /// </summary>
    class constructor Create;

    /// <summary>
    /// Class destructor cleans up singleton and synchronization resources.
    /// </summary>
    class destructor Destroy;
  end;

implementation

{ TPrintStrategyFactory }

class constructor TPrintStrategyFactory.Create;
begin
  FLock := TCriticalSection.Create;
  FInstance := nil;
end;

class destructor TPrintStrategyFactory.Destroy;
begin
  FreeAndNil(FInstance);
  FreeAndNil(FLock);
end;

class function TPrintStrategyFactory.GetInstance: TPrintStrategyFactory;
begin
  if not Assigned(FInstance) then
  begin
    FLock.Acquire;
    try
      if not Assigned(FInstance) then
        FInstance := TPrintStrategyFactory.Create;
    finally
      FLock.Release;
    end;
  end;
  Result := FInstance;
end;

function TPrintStrategyFactory.CreatePrintStrategy: IPrintStrategy;
var
  Strategy: IPrintStrategy;
  Code: IStatusCode;
begin
  Strategy := TPrintStrategyImplementation.Create;
  Code := Strategy.SetupPrinting;

  if Code.GetStatusCode <> 0 then
    raise EPrintStrategyError.CreateFmt('Failed to create IPrintStrategy: [HW%d]',
      [Code.GetStatusCode]);

  Result := Strategy;
end;

end.
