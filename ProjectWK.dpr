program ProjectWK;

uses
  Vcl.Forms,
  V.PedVenda in 'V.PedVenda.pas' {FrPedVenda},
  M.DM in 'M.DM.pas' {DM: TDataModule},
  V.Cliente in 'V.Cliente.pas' {FrCliente},
  C.Cliente in 'C.Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrPedVenda, FrPedVenda);
  Application.Run;
end.
