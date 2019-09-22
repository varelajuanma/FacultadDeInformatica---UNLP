unit UOpcion1y2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
begin
  Edit1.Text := 'Opción 1 selecciona'
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
  Edit1.Text := 'Opción 2 selecciona';
end;

procedure TForm7.FormClick(Sender: TObject);
begin
  messageDlg('Clickee sobre uno de los dos botones!', mterror, [mbok], 0);
end;

end.
