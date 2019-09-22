program Project5;

uses
  Forms,
  Ubotondificildealcanzar in 'Ubotondificildealcanzar.pas' {Ejercicio2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TEjercicio2, Ejercicio2);
  Application.Run;
end.
