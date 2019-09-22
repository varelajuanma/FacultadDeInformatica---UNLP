unit UCambioColor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    procedure FormActivate(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
begin
  Form1.Caption := 'Rojo';
  Form1.Color := clred;

end;

procedure TForm1.FormClick(Sender: TObject);
begin
  if Form1.Color = clred then
    begin
        Form1.Color := clblue;
        Form1.Caption := 'AZUL';
    end
  else
    begin
        Form1.Color := clred;
        Form1.Caption := 'ROJO';
    end;
end;

end.
