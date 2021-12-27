unit C.Cliente;

interface

uses SysUtils,Data.DB;

type

TCliente = class
private
  FNome : string;
  FCidade : string;
  FUf : string;
  procedure SetNome(const Value : string);
  procedure SetCidade(const Value : string);
  procedure SetUF(const Value : string);
  published

public
  property Nome : string read FNome write SetNome;
  property Cidade : string read FCidade write SetCidade;
  property UF : string read FUF write SetUf;

  function BuscaCliente(busca:string):string;
end;

implementation

uses M.DM;

function TCliente.BuscaCliente(busca: string): string;
begin
  DM.QueryCliente.ParamByName('CODCLIENTE').Value := busca;
  DM.QueryCliente.Open;
  if DM.QueryCliente.IsEmpty then
    result := ''
  else
    result := DM.QueryCliente.FieldByName('NOME').Value;
  DM.QueryCliente.Close;

end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TCliente.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TCliente.SetUF(const Value: string);
begin
  FUf := Value;
end;
end.
