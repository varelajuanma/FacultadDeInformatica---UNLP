unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TForm2.Edit1Change(Sender: TObject);
  begin
    if (length(edit1.Text) >= 2) and (length(edit1.Text) <= 16) then begin
      button1.Enabled := true;
      end
    else
      button1.Enabled := false;
  end;

end.
