program Nubank;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Principal in 'View\View.Principal.pas' {ViewPrincipal},
  View.Lancamentos in 'View\View.Lancamentos.pas' {FrmLancamentos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TFrmLancamentos, FrmLancamentos);
  Application.Run;
end.
