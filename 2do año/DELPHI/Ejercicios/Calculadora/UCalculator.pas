unit UCalculator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TCalculator = class(TForm)
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Calculator: TCalculator;

implementation

{$R *.dfm}

procedure TCalculator.SpeedButton1Click(Sender: TObject);
var
  Nro1,Nro2:integer;
begin
  Try
    Nro1 := StrToInt(Edit1.Text);
    Nro2 := StrToInt(Edit2.Text);
    Edit3.Text := IntToStr(Nro1 + Nro2);
  except
    on EConvertError do begin
        Edit3.text:= '';
        ShowMessage('Operandos Inválidos');
    end;
  end;
end;
end.
