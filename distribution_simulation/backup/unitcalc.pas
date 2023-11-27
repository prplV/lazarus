unit unitCalc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormCalc }

  TFormCalc = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
  private

  public

  end;

var
  FormCalc: TFormCalc;

implementation

{$R *.lfm}

{ TFormCalc }

procedure TFormCalc.ButtonCloseClick(Sender: TObject);
begin
  ModalResult:=99;
end;

procedure TFormCalc.Button1Click(Sender: TObject);
type
  TAdd=function(x,y:Longint):Longint;
var
  z:Integer;
  libhandle:HMODULE;
  add:TAdd;
begin
  // switch to dll func 'Add'
     //ModalResult:= StrToInt(Edit1.Text) + StrToInt(Edit2.Text);
  libhandle := safeloadlibrary('f.dll');
  if libhandle <>0 then begin
     add:=TAdd(GetProcedureAddress(libhandle, 'Add'));
     if Assigned(Add) then begin
             z:=Add(StrToInt(Edit1.Text), StrToInt(Edit2.Text));
             ModalResult := z;
     end;
     FreeLibrary(libhandle);
  end;
end;

procedure TFormCalc.Button2Click(Sender: TObject);
type
  TDec=function(x,y:Longint):Longint;
var
  z:Integer;
  libhandle:HMODULE;
  dec:TDec;
begin
     // switch to dll func 'Dec'
     //ModalResult:= StrToInt(Edit1.Text) - StrToInt(Edit2.Text);
     libhandle := safeloadlibrary('f.dll');
      if libhandle <> 0 then begin
         dec:=TDec(GetProcedureAddress(libhandle, 'Dec'));
         if Assigned(Dec) then begin
                 z:=Dec(StrToInt(Edit1.Text), StrToInt(Edit2.Text));
                 ModalResult := z;
         end;
         FreeLibrary(libhandle);
      end;
    end;

end.

