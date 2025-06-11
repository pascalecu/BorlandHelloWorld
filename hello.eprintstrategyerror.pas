unit Hello.EPrintStrategyError;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  /// <summary>
  /// Exception class representing errors related to print strategy failures.
  /// </summary>
  EPrintStrategyError = class(Exception)
  public
    /// <summary>
    /// Creates an instance of <c>EPrintStrategyError</c> with a given message.
    /// </summary>
    /// <param name="Msg">The error message.</param>
    constructor Create(const Msg: string); overload;

    /// <summary>
    /// Creates an instance of <c>EPrintStrategyError</c> with a formatted message.
    /// </summary>
    /// <param name="Fmt">Format string.</param>
    /// <param name="Args">Format arguments.</param>
    constructor CreateFmt(const Fmt: string; const Args: array of const); overload;
  end;

implementation

{ EPrintStrategyError }

constructor EPrintStrategyError.Create(const Msg: string);
begin
  inherited Create(Msg);
end;

constructor EPrintStrategyError.CreateFmt(const Fmt: string; const Args: array of const);
begin
  inherited CreateFmt(Fmt, Args);
end;

end.
