program HelloWorld;

{$mode objfpc}
{$H+}

uses
  Hello.HelloWorld,
  SysUtils;

/// <summary>
/// Creates an instance of THelloWorld to execute the main application logic.
/// </summary>
/// <remarks>
/// Ensures the instance is freed after use to prevent resource leaks.
/// </remarks>
procedure InstantiateHelloWorldMainAndRun;
var
  Instance: THelloWorld;
begin
  Instance := nil;
  try
    Instance := THelloWorld.Create;
  finally
    Instance.Free;
  end;
end;

/// <summary>
/// Program entry point. Executes the main logic and handles unhandled exceptions.
/// </summary>
/// <exception cref="Exception">
/// Raised if an unhandled exception occurs during execution. The error is logged
/// and the program terminates with exit code 1.
/// </exception>
begin
  try
    InstantiateHelloWorldMainAndRun;
  except
    on E: Exception do
    begin
      Writeln('==============================================================');
      Writeln('[ERROR] An unhandled exception occured:');
      Writeln('  ', E.Message);
      Writeln('==============================================================');
      Halt(1);
    end;
  end;
end.
