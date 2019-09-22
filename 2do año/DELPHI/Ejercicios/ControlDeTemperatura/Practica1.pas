unit Practica1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TEjercicio1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ejercicio1: TEjercicio1;

implementation

{$R *.dfm}

procedure TEjercicio1.Button1Click(Sender: TObject);
begin
  if (StrToInt (panel1.Caption) < 40) then begin
    panel1.Caption := IntToStr (StrToInt (panel1.Caption) + 1);
    button2.Enabled := true;
  end;
  if (StrToInt (panel1.Caption) = 40) then begin
    button1.Enabled := false;
  end;
  if (StrToInt (panel1.Caption) = 15) then begin
    panel1.Color := clyellow;
  end;
  if (StrToInt (panel1.Caption) = 35) then begin
    panel1.Color := clred;
  end;
end;

procedure TEjercicio1.Button2Click(Sender: TObject);
begin
  if (StrToInt (panel1.Caption) > 0) then begin
    panel1.Caption := IntToStr (StrToInt (panel1.Caption) - 1);
    button1.Enabled := true;
  end;
  if (StrToInt (panel1.Caption) = 0) then begin
    button2.Enabled := false;
  end;
  if (StrToInt (panel1.Caption) = 15) then begin
    panel1.Color := clblue;
  end;
  if (StrToInt (panel1.Caption) = 35) then begin
    panel1.Color := clyellow;
  end;
end;
end.


