program Project13;

uses
  Forms,
  EjercicioEjemploDobleVentana in 'EjercicioEjemploDobleVentana.pas' {Form15},
  Uejercicioejemplo in 'Uejercicioejemplo.pas' {FDatos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TFDatos, FDatos);
  Application.Run;
end.
