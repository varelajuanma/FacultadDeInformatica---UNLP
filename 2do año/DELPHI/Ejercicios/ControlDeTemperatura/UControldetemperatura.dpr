program UControldetemperatura;

uses
  Forms,
  Practica1 in 'Practica1.pas' {Ejercicio1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TEjercicio1, Ejercicio1);
  Application.Run;
end.
