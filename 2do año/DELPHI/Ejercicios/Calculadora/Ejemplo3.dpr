program Ejemplo3;

uses
  Forms,
  UCalculator in 'UCalculator.pas' {Calculator};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCalculator, Calculator);
  Application.Run;
end.
