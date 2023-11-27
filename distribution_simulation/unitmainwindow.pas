unit unitMainWindow;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  StdCtrls,
  unitCalc,
  Dos;

type

  { TFormMain }

    TFormMain = class(TForm)
    ButtonStartDemo: TButton;
    ButtonStartFull: TButton;
    Label1: TLabel;
    procedure ButtonStartDemoClick(Sender: TObject);
    procedure ButtonStartFullClick(Sender: TObject);
  private

  public
    z:Integer;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.lfm}

{ TFormMain }

procedure TFormMain.ButtonStartDemoClick(Sender: TObject);
type
  TInitFormFunc=function():Longint;
var
  libhandle:HMODULE;
  InitFormFunc:TInitFormFunc;
begin
  // demo bat
  ExecuteProcess('scripts/demo.bat', '');

  //func init from dll
  //Application.CreateForm(TFormCalc,FormCalc);
  //z:=FormCalc.ShowModal;
  //FormCalc.Free;
  //Label1.Caption:=IntToStr(z);


  libhandle := safeloadlibrary('f.dll');
  if libhandle <>0 then begin
     InitFormFunc:=TInitFormFunc(GetProcedureAddress(libhandle, 'InitFormFunc'));
     if Assigned(InitFormFunc) then begin
             Label1.Caption:= IntToStr(InitFormFunc());
     end;
     FreeLibrary(libhandle);
     //Label1.Caption:= IntToStr(z);
  end;



  //z:=FormCalc.ShowModal;
end;

procedure TFormMain.ButtonStartFullClick(Sender: TObject);
begin
  //full bat
  ExecuteProcess('scripts/full.bat', '');

  //func init from dll
  Application.CreateForm(TFormCalc,FormCalc);
  z:=FormCalc.ShowModal;
  FormCalc.Free;
  Label1.Caption:=IntToStr(z);
end;

end.

