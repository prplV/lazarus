library init;

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

function Init(): Integer; stdcall; export;
begin
  Application.Initialize;
  Application.CreateForm(TFormCalc,FormCalc);
  FormCalc.ShowModal;
  Result:=FormCalc.ModalResult;
  FormCalc.Free;
end;
begin
end.

