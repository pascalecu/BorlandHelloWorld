unit Hello.HelloWorldFactory;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,
  Hello.IHelloWorld,
  Hello.HelloWorldImplementation,
  SyncObjs;

type

  /// <summary>
  /// Singleton factory for creating <c>IHelloWorld</c> instances.
  /// </summary>
  /// <remarks>
  /// Thread-safe implementation using <c>TCriticalSection</c>.
  /// </remarks>
  THelloWorldFactory = class
  private
  class var FInstance: THelloWorldFactory;
  class var FLock: TCriticalSection;
  public
    /// <summary>
    /// Class constructor initializes thread synchronization primitives.
    /// </summary>
    class constructor Create;
    /// <summary>
    /// Class destructor frees singleton instance and synchronization primitives.
    /// </summary>
    class destructor Destroy;

    /// <summary>
    /// Retrieves the singleton instance of the factory.
    /// </summary>
    /// <returns>The singleton <c>THelloWorldFactory</c> instance.</returns>
    /// <remarks>
    /// Ensures thread-safe lazy initialization of the singleton instance.
    /// </remarks>
    class function GetInstance: THelloWorldFactory;

    /// <summary>
    /// Creates a new <c>IHelloWorld</c> instance.
    /// </summary>
    /// <returns>A new <c>IHelloWorld</c> implementation instance.</returns>
    function CreateHelloWorld: IHelloWorld;
  end;

implementation

class constructor THelloWorldFactory.Create;
begin
  FLock := TCriticalSection.Create;
end;

class destructor THelloWorldFactory.Destroy;
begin
  FreeAndNil(FInstance);
  FreeAndNil(FLock);
end;

class function THelloWorldFactory.GetInstance: THelloWorldFactory;
begin
  if not Assigned(FInstance) then
  begin
    FLock.Acquire;
    try
      if not Assigned(FInstance) then
        FInstance := THelloWorldFactory.Create;
    finally
      FLock.Release;
    end;
  end;
  Result := FInstance;
end;

function THelloWorldFactory.CreateHelloWorld: IHelloWorld;
begin
  Result := THelloWorldImplementation.Create;
end;

end.
