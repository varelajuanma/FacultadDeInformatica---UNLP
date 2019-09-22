unit Verificadordepalabras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    MemoPalabras: TMemo;
    Panel1: TPanel;
    VerificarTexto: TBitBtn;
    EliminarPalabras: TBitBtn;
    EliminarNumeros: TBitBtn;
    MainMenu1: TMainMenu;
    Archivo1: TMenuItem;
    Abrirarchivo1: TMenuItem;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    EliminarPalabras1: TMenuItem;
    Eliminartodaslaspalabras1: TMenuItem;
    Eliminarnumero1: TMenuItem;
    Eliminartodoslosnumeros1: TMenuItem;
    Guardarenunarchivo2: TMenuItem;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ListBoxPalabras: TListBox;
    GroupBox3: TGroupBox;
    ListBoxNumeros: TListBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Guardarenunarchivo1: TMenuItem;
    procedure VerificarTextoClick(Sender: TObject);
    procedure EliminarPalabrasClick(Sender: TObject);
    procedure EliminarNumerosClick(Sender: TObject);
    procedure Abrirarchivo1Click(Sender: TObject);
    procedure Guardarenunarchivo1Click(Sender: TObject);
    procedure EliminarPalabras1Click(Sender: TObject);
    procedure Eliminarnumero1Click(Sender: TObject);
    procedure Eliminartodaslaspalabras1Click(Sender: TObject);
    procedure Eliminartodoslosnumeros1Click(Sender: TObject);
    procedure MemoPalabrasChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Abrirarchivo1Click(Sender: TObject);
var
  NomArch:string;
begin
  if Opendialog1.Execute then begin
    NomArch:=Opendialog1.FileName;
    MemoPalabras.Lines.LoadFromFile(NomArch);
    end;
end;
procedure TForm1.Eliminarnumero1Click(Sender: TObject);
var
  i:integer;
  texto:string;
begin
  ListBoxNumeros.DeleteSelected;
  i := ListBoxNumeros.Items.Count;
  texto := 'N�meros verificados ('+FloatToStr(i)+')';
  GroupBox3.Caption := texto;
end;

procedure TForm1.EliminarNumerosClick(Sender: TObject);
begin
  ListBoxNumeros.Items.Clear;
  GroupBox3.Caption := 'N�meros verificados (0)';
end;

procedure TForm1.EliminarPalabras1Click(Sender: TObject);
var
  i:integer;
  texto:string;
begin
  ListBoxPalabras.DeleteSelected;
  i := ListBoxPalabras.Items.Count;
  texto := 'Palabras verificadas ('+FloatToStr(i)+')';
  GroupBox2.Caption := texto;
end;

procedure TForm1.EliminarPalabrasClick(Sender: TObject);
begin
  ListBoxPalabras.Items.clear;
  GroupBox2.Caption := 'Palabras verificadas (0)';
end;

procedure TForm1.Eliminartodaslaspalabras1Click(Sender: TObject);
begin
  ListBoxPalabras.Clear;
  GroupBox2.Caption := 'Palabras verificadas (0)';
end;

procedure TForm1.Eliminartodoslosnumeros1Click(Sender: TObject);
begin
  ListBoxNumeros.Clear;
  GroupBox3.Caption := 'N�meros verificados (0)';
end;

procedure TForm1.Guardarenunarchivo1Click(Sender: TObject);
var
  NomArch:string;
begin
  if Savedialog1.Execute then begin
    NomArch:=Savedialog1.FileName;
    MemoPalabras.Lines.SaveToFile(NomArch);
  end;
end;

procedure TForm1.MemoPalabrasChange(Sender: TObject);
var
  i:integer;
  texto:string;
begin
  i := MemoPalabras.Lines.Count;
  texto := 'Texto a verificar ('+FloatToStr(i)+')';
  GroupBox1.Caption := texto;
end;

procedure TForm1.VerificarTextoClick(Sender: TObject);
var
  nro:real;
  i,p,n:integer;
  texto1,texto2:string;
begin
  for I := 0 to MemoPalabras.Lines.Count - 1 do
    try
      nro:=StrToFloat(MemoPalabras.Lines.Strings[i]);
      ListBoxNumeros.Items.Add(MemoPalabras.Lines.Strings[i]);
    except
      on E:EConvertError do
        ListBoxPalabras.Items.Add(MemoPalabras.Lines.Strings[i]);
    end;
  {Es para cambiar el contador de palabras de los groupbox}
  p := ListBoxPalabras.Items.Count;
  n := ListBoxNumeros.Items.Count;
  texto1 := 'Palabras verificadas ('+FloatToStr(p)+')';
  texto2 := 'N�meros verificados ('+FloatToStr(n)+')';
  GroupBox2.Caption := texto1;
  GroupBox3.Caption := texto2;
end;

end.
