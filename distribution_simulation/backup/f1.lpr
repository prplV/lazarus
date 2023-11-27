library f1;

{$mode objfpc}{$H+}

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  StdCtrls,
  unitCalc,
  Interfaces;
  { you can add units after this }

function Init(a, b: Integer): Integer; stdcall; export;
begin
  Application.Initialize;
  Application.CreateForm(TFormCalc,FormCalc);
  FormCalc.ShowModal;
  Result:=FormCalc.ModalResult;
  FormCalc.Free;
end;

function Add(x, y: Integer): Integer; stdcall; export;
begin
  Result := x + y;
end;
function Dec(x, y: Integer): Integer; stdcall; export;
begin
  Result := x - y;
end;
exports
  Add name 'Add',
  Dec name 'Dec';
begin
end.

