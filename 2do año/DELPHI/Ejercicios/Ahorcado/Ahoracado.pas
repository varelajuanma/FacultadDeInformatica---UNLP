unit Ahoracado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ImgList, jpeg, unit2;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Juego1: TMenuItem;
    Salir1: TMenuItem;
    Otrapalabra1: TMenuItem;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Edit2: TEdit;
    procedure Otrapalabra1Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  EsteBoton: Tbutton;
  p,sec,c: string;
  i,error,aciertos: integer;
  ok: boolean;
begin
  error:= StrToInt(label2.Caption);
  sec := Edit1.text;
  p := Form2.Edit1.Text;
  EsteBoton := TButton (sender);
  c := EsteBoton.Caption[1];
  aciertos:= StrToInt(edit2.Text);
  for i := 2 to length(p) do
    If (p[i] = c[1]) then begin
      aciertos:=aciertos + 1;
      edit2.Text:=IntToStr(aciertos);
      sec[i+i-1] := c[1];
      ok := true;
    end;
  if (ok = false) then begin
    error:= error + 1;
    Label2.Caption := IntToStr(error);
    case error of
      1:image2.visible:=true;
      2:image3.visible:=true;
      3:image4.visible:=true;
      4:image5.visible:=true;
      5:image6.visible:=true;
      6:image7.visible:=true;
      7:image8.visible:=true;
    end;
  end;
  Edit1.text:=sec;
  Esteboton.Enabled := False;
  if (StrToInt(edit2.Text) = length(p)) then begin
    Messagedlg('¡GANASTE!. Encontraste la palabra.',mtinformation,[mbok],0);
    for I := 0 to panel1.ControlCount - 1 do
     panel1.Controls[i].Enabled:=false;
  end;
  if (error = 7) then begin
   Messagedlg('¡PERDISTE!. La palabra era "'+p+'".',mtinformation,[mbok],0);
   for I := 0 to panel1.ControlCount - 1 do
     panel1.Controls[i].Enabled:=false;
  end;
end;

procedure TForm1.Otrapalabra1Click(Sender: TObject);
var
  I: Integer;
  s,p,aux:string;
  MiButton: Tbutton;
  J: Integer;
begin
  if (Form2.ShowModal=mrOk) then begin
    s:='';
    p:= Form2.Edit1.Text;
    end;

  for I := 1 to length(p) do
    if (p[I] = p[1]) then begin
      s := s + p[1];
      end
    else
      s := s + ' ' + '_';
  edit1.Text := s;

  for J := 0 to Panel1.ControlCount - 1 do begin
    MiButton := Panel1.Controls[J] as TButton;
    MiButton.Enabled := true;
    aux:=MiButton.Caption;
    If (aux[1] = p[1]) then begin
      Mibutton.Enabled := false;
    end;
  end;
  label2.Caption:= IntToStr(0);
  edit2.Text:= IntToStr(1);
end;

procedure TForm1.Salir1Click(Sender: TObject);
begin
  Form1.Close;
end;

end.
