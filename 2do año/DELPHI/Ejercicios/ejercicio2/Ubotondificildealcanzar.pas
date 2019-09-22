unit Ubotondificildealcanzar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TEjercicio2 = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Bitbtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure Bitbtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ejercicio2: TEjercicio2;

implementation

{$R *.dfm}



procedure TEjercicio2.BitBtn1Click(Sender: TObject);
begin
  ShowMessage('Estas haciendo trampa');
end;

procedure TEjercicio2.BitBtn1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  begin
    if (SpeedButton2.Down) then begin
      BitBtn1.Left := random(273);
      BitBtn1.Top := random(216);
      bitbtn2.Enabled := true;
      bitbtn3.Enabled := true;
      bitbtn4.Enabled := true;
      bitbtn5.Enabled := true;
    end;
  end;

procedure TEjercicio2.Bitbtn2Click(Sender: TObject);
begin
  if (bitbtn1.Left - StrToInt(Edit1.Text) <= 0) then begin
    bitbtn1.Left:= 0;
    bitbtn2.Enabled := false;
  end;
  if (Bitbtn1.Left - StrToInt(Edit1.Text) > 0) then begin
    Bitbtn1.Left:= Bitbtn1.Left - StrToInt(Edit1.Text);
    bitbtn5.Enabled := true;
  end;

end;

procedure TEjercicio2.BitBtn3Click(Sender: TObject);
begin
   if (bitbtn1.top - StrToInt(Edit1.Text) <= 0) then begin
    bitbtn1.top := 0;
    bitbtn3.Enabled := false;
  end;
  if (Bitbtn1.top - StrToInt(Edit1.Text) > 0) then begin
    Bitbtn1.top:= Bitbtn1.Top - StrToInt(Edit1.Text);
    bitbtn4.Enabled:=true;
  end;
end;

procedure TEjercicio2.BitBtn4Click(Sender: TObject);
begin
  if (bitbtn1.top + Bitbtn1.height + StrToInt(edit1.Text) < Panel1.height) then begin
    bitbtn1.top:= bitbtn1.top + StrToInt(Edit1.Text);
    bitbtn3.Enabled := true;
  end;
  if (bitbtn1.top + Bitbtn1.height + StrToInt(edit1.Text) >= Panel1.height) then begin
    bitbtn1.top := panel1.height - bitbtn1.height;
    bitbtn4.Enabled := false;
  end;
end;

procedure TEjercicio2.BitBtn5Click(Sender: TObject);
begin
  if (bitbtn1.Left + Bitbtn1.Width + StrToInt(edit1.Text) < Panel1.Width) then begin
    bitbtn1.Left:= bitbtn1.Left + StrToInt(Edit1.Text);
    bitbtn2.Enabled := true;
  end;
  if (bitbtn1.Left + Bitbtn1.Width + StrToInt(edit1.Text) >= Panel1.Width) then begin
    bitbtn1.left := panel1.Width - bitbtn1.Width;
    bitbtn5.Enabled := false;
  end;

end;

end.
