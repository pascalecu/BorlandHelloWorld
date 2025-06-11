unit Hello.IHelloWorldString;

{$mode ObjFPC}{$H+}

interface

uses
  Hello.HelloWorldString;

type
  /// <summary>
  /// Interface representing a provider of a HelloWorld string.
  /// </summary>
  IHelloWorldString = interface
    ['{1453D461-9D59-4A6E-BB27-57ACA3D7A803}']
    /// <summary>
    /// Gets the HelloWorld string instance.
    /// </summary>
    /// <returns>Returns a <see cref="THelloWorldString"/> instance containing the HelloWorld string.</returns>
    function GetHelloWorldString: THelloWorldString;
  end;

implementation

end.
