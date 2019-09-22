unit Uejercicioejemplo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFDatos = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDatos: TFDatos;

implementation

{$R *.dfm}

procedure TFDatos.Button1Click(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

procedure TFDatos.Button2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
