unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Agregar: TButton;
    Borrar: TButton;
    Label2: TLabel;
    procedure AgregarClick(Sender: TObject);
    procedure BorrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AgregarClick(Sender: TObject);
begin
  if (length(edit1.Text) <= 65) then begin
    label2.Caption:=edit1.Text;
    label2.Color:=clRed;
  end;
  if (length(edit1.Text) > 65) then begin
    label2.Caption:=copy(edit1.Text,1,5);
    Showmessage('Longitud excedida');
  end;

end;

procedure TForm1.BorrarClick(Sender: TObject);
begin
  Edit1.Clear;
  label2.Caption := '';
end;

end.
