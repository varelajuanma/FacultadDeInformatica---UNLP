unit EjercicioEjemploDobleVentana;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm15 = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

uses Unit16;

{$R *.dfm}

procedure TForm15.Button1Click(Sender: TObject);
begin
  if FDatos.ShowModal = mrOK then
    Showmessage('Sus datos seran procesados');
end;

end.
