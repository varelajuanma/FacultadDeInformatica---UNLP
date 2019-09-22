program Ejemplo2;

uses
  Forms,
  UOpcion1y2 in 'UOpcion1y2.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
