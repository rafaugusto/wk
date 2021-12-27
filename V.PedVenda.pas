unit V.PedVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFrPedVenda = class(TForm)
    sgListaItens: TStringGrid;
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblNomeProduto: TLabel;
    edtCodProduto: TEdit;
    edtQuantidade: TEdit;
    btnAdicionarItem: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel3: TPanel;
    Label4: TLabel;
    lblValorTotal: TLabel;
    btnCancelarAlteracao: TButton;
    Label11: TLabel;
    edtValorUnitario: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label9: TLabel;
    edtCliente: TEdit;
    Button1: TButton;
    Label10: TLabel;
    edtNumPedido: TEdit;
    Button4: TButton;
    btnExcluirPedido: TButton;
    lblNumPedido: TLabel;
    lblCliente: TLabel;
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCancelarAlteracaoClick(Sender: TObject);
    procedure sgListaItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcluirPedidoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure SomaValores;
    procedure EditaItemGrid(linha: integer);
    procedure CarregarPedido(numpedido: string);
    procedure InsereItemGrid(codproduto, nomeproduto, quantidade, valorunit: string);
    procedure ExcluirItem(linha: integer);
    procedure LimparGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrPedVenda: TFrPedVenda;

implementation

{$R *.dfm}

uses M.DM, C.Cliente;

procedure TFrPedVenda.CarregarPedido(numpedido:string);
begin
  with DM.QueryPedidos do
  begin
    ParamByName('NUMPEDIDO').Value := numpedido;
    Open;
    if DM.QueryPedidos.IsEmpty then
    begin
      ShowMessage('Pedido não encontrado!');
      edtNumPedido.Clear;
      edtNumPedido.SetFocus;
      Close;
      Exit;
    end;
    while not DM.QueryPedidos.Eof do
    begin
      InsereItemGrid(FieldByName('cod_produto').Value,FieldByName('nomeproduto').Value,FieldByName('quantidade').Value,FormatFloat(',.00',FieldByName('vlr_unitario').AsFloat));
      Next;
    end;
    lblNumPedido.Caption := 'Pedido nº '+numpedido;
    lblNumPedido.Tag := StrToInt(numpedido); // Gravando na TAG para uso futuro
    lblCliente.Caption := FieldByName('nome_cliente').Value;
    btnExcluirPedido.Visible := True;
    Close;
  end;

end;

procedure TFrPedVenda.EditaItemGrid(linha:integer);
begin
  edtCodProduto.Text := sgListaItens.Cells[0,linha];
  lblNomeProduto.Caption := sgListaItens.Cells[1,linha];
  edtValorUnitario.Text := sgListaItens.Cells[3,linha];
  edtQuantidade.Text := sgListaItens.Cells[2,linha];

  btnAdicionarItem.Caption := 'Salvar Item';
end;

procedure TFrPedVenda.btnCancelarAlteracaoClick(Sender: TObject);
begin
  // ------- Ajustando campos e botões ao cancelar a alteração ------- //
  btnCancelarAlteracao.Visible := False;
  btnAdicionarItem.Caption := 'Adicionar Item';
  edtCodProduto.Clear;
  lblNomeProduto.Caption := '';
  edtValorUnitario.Text := '';
  edtQuantidade.Text := '';
end;

procedure TFrPedVenda.btnExcluirPedidoClick(Sender: TObject);
begin
  // ------- Excluindo dados do pedido ------- //
  try
    DM.QueryGravaPedido.SQL.Text := 'DELETE FROM PEDIDOS_PRODUTOS WHERE NUM_PEDIDO='+IntToStr(lblNumPedido.Tag)+';'
                                  + 'DELETE FROM PEDIDOS_GERAIS WHERE NUMERO='+IntToStr(lblNumPedido.Tag)+';';
    DM.QueryGravaPedido.ExecSQL;
    ShowMessage('Pedido excluído!');
    LimparGrid;
  except

  end;
end;

procedure TFrPedVenda.LimparGrid;
var
i:integer;
begin
  // ------- Limpando dados da Grid ------- //
  i := 0;
  while i<sgListaItens.RowCount do
  begin
    sgListaItens.Cells[0,i] := '';
    sgListaItens.Cells[1,i] := '';
    sgListaItens.Cells[2,i] := '';
    sgListaItens.Cells[3,i] := '';
    sgListaItens.Cells[4,i] := '';
    Inc(i);
  end;
  sgListaItens.RowCount := 1;

end;

procedure TFrPedVenda.Button1Click(Sender: TObject);
var
Cliente:TCliente;
begin
  if edtCliente.Text<>'' then
  begin
    Cliente := TCliente.Create;
    lblCliente.Caption := Cliente.BuscaCliente(edtCliente.Text);
    Cliente.Free;
    if lblCliente.Caption='' then
    begin
      ShowMessage('Cliente não encontrado!');
      edtCliente.Clear;
      edtCliente.SetFocus;
      Exit;
    end;

    LimparGrid;

    lblNumPedido.Caption := 'Novo Pedido';
    lblNumPedido.Tag := 0;
    edtCodProduto.SetFocus;
  end;
end;

procedure TFrPedVenda.Button2Click(Sender: TObject);
var
i:integer;
paramNumPedido,sql:string;
begin
  // ------- Gravando Pedido ------- //
  if (lblNumPedido.Tag=0) then
  begin
      sql := 'insert into pedidos_gerais(data_emissao,cod_cliente,valor) values '
        +'('''+FormatDateTime('yyyy-mm-dd',Date)+''','''+IntToStr(lblCliente.Tag)+''','''+StringReplace(lblValorTotal.Caption,',','.',[])+''');';
      paramNumPedido := '(select max(numero) from pedidos_gerais)';
  end
  else
  begin
    sql := 'delete from pedidos_produtos where num_pedido='+IntToStr(lblNumPedido.Tag)+';';
    paramNumPedido := IntToStr(lblNumPedido.tag);
  end;

  while i<sgListaItens.RowCount do
  begin
    sql := sql + 'insert into pedidos_produtos(num_pedido,cod_produto,quantidade,vlr_unitario,vlr_total) values '
               + '('+paramNumPedido+','''+sgListaItens.Cells[0,i]+''','''+sgListaItens.Cells[2,i]+''','''+StringReplace(sgListaItens.Cells[3,i],',','.',[])+''','''+StringReplace(sgListaItens.Cells[4,i],',','.',[])+''');';
    Inc(i);
  end;
  DM.QueryGravaPedido.SQL.Text := sql;
  DM.QueryGravaPedido.ExecSQL;

  ShowMessage('Pedido Gravado com Sucesso!');
  Close;

end;

procedure TFrPedVenda.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrPedVenda.Button4Click(Sender: TObject);
begin

  if edtNumPedido.Text <> '' then
  begin
    LimparGrid;
    CarregarPedido(edtNumPedido.Text);
  end;
end;

procedure TFrPedVenda.edtCodProdutoExit(Sender: TObject);
begin
  // ------- Buscando dados do produto ao digitar o código ------- //
  if edtCodProduto.Text<>'' then
  with DM.QueryBuscaProduto do
  begin
    Close;
    ParamByName('CODIGO').Value := edtCodProduto.Text;
    Open;
    if RecordCount>0 then
    begin
      lblNomeProduto.Caption := FieldByname('descricao').AsString;
      edtValorUnitario.Text := FormatFloat('R$ ,.00', FieldByname('precovenda').AsFloat);
    end
    else
    begin
      ShowMessage('Produto não encontrado!');
      edtCodProduto.Clear;
      edtCodProduto.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFrPedVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // ------- Usando ENTER para facilitar para o usuário ------- //
  if Key = #13 then
  if not (ActiveControl is TStringGrid) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end
end;

procedure TFrPedVenda.FormShow(Sender: TObject);
begin
  btnCancelarAlteracao.Visible := False;
  sgListaItens.ColWidths[1] := 340;
  lblNomeProduto.Caption := '';
  edtValorUnitario.Text := '';
  lblCliente.Caption := '';
  lblNumPedido.Caption := '';
end;

procedure TFrPedVenda.SomaValores;
var
i:integer;
soma:real;
begin
  // ------- Somando valores contidos na Grid ------- //
  soma:=0;
  i:=0;
  while (i<sgListaItens.RowCount) do
  begin
    soma := soma+((StrToFloat(sgListaItens.Cells[4,i])));
    Inc(i);
  end;
  lblValorTotal.Caption := FormatFloat(',.00',soma);
end;

procedure TFrPedVenda.InsereItemGrid(codproduto,nomeproduto,quantidade,valorunit:string);
begin
  if sgListaItens.Cells[0,0]<>'' then
    sgListaItens.RowCount := sgListaItens.RowCount+1;
  sgListaItens.Cells[0,sgListaItens.RowCount-1] := codproduto;
  sgListaItens.Cells[1,sgListaItens.RowCount-1] := nomeproduto;
  sgListaItens.Cells[2,sgListaItens.RowCount-1] := quantidade;
  sgListaItens.Cells[3,sgListaItens.RowCount-1] := valorunit;
  sgListaItens.Cells[4,sgListaItens.RowCount-1] := FormatFloat(',.00',StrToFloat(valorunit)*StrToInt(quantidade));

  SomaValores;
end;

procedure TFrPedVenda.sgListaItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // ------- Tratamento das teclas ENTER e DEL para trabalho na Grid ------- //

  if Key = VK_RETURN then // Usuário teclando ENTER
    begin
      //---- Editando Item ----
      edtCodProduto.Text := sgListaItens.Cells[0,sgListaItens.Row];
      lblNomeProduto.Caption := sgListaItens.Cells[1,sgListaItens.Row];
      edtQuantidade.Text := sgListaItens.Cells[2,sgListaItens.Row];
      edtValorUnitario.Text := FormatFloat('R$ ,.00',StrToFloat(sgListaItens.Cells[3,sgListaItens.Row]));
      btnAdicionarItem.Caption := 'Alterar Item';
      btnCancelarAlteracao.Visible := True;
      sgListaItens.Tag := sgListaItens.Row;
      //-----------------------
    end;

    if Key = VK_DELETE then // Usuário teclado DEL
    begin
      showmessage('ii');
      if MessageDlg('Deseja excluir o item selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        ExcluirItem(sgListaItens.Row);
      end;
    end;
end;

procedure TFrPedVenda.ExcluirItem(linha:integer);
var
i:integer;
begin
  // ------- Excluindo item da grid ------- //
  i := linha;
  while (i<sgListaItens.RowCount) do
  begin
    sgListaItens.Cells[0,i] := sgListaItens.Cells[0,i+1];
    sgListaItens.Cells[1,i] := sgListaItens.Cells[1,i+1];
    sgListaItens.Cells[2,i] := sgListaItens.Cells[2,i+1];
    sgListaItens.Cells[3,i] := sgListaItens.Cells[3,i+1];
    sgListaItens.Cells[4,i] := sgListaItens.Cells[4,i+1];
    Inc(i);
  end;
  sgListaItens.RowCount := sgListaItens.RowCount-1;
end;

procedure TFrPedVenda.btnAdicionarItemClick(Sender: TObject);
begin
  // ------- Botão 'Adicionar Item' ou 'Alterar Item' dependendo da situação ------- //
  if (edtQuantidade.Text='0') or (edtQuantidade.Text='') then
  begin
    ShowMessage('Insira um valor para a quantidade!');
    edtQuantidade.SetFocus;
    Exit;
  end;

  if btnAdicionarItem.Caption = 'Alterar Item' then
  begin
    sgListaItens.Cells[0,sgListaItens.Row] := edtCodProduto.Text;
    sgListaItens.Cells[1,sgListaItens.Row] := lblNomeProduto.Caption;
    sgListaItens.Cells[2,sgListaItens.Row] := edtQuantidade.Text;
    sgListaItens.Cells[3,sgListaItens.Row] := Copy(edtValorUnitario.Text,4,40);
    sgListaItens.Cells[4,sgListaItens.Row] := FormatFloat(',.00',StrToFloat(Copy(edtValorUnitario.Text,4,40))*StrToInt(edtQuantidade.Text));
    btnAdicionarItem.Caption := 'Adicionar Item';
    btnCancelarAlteracao.Visible := False;
  end
  else
    InsereItemGrid(edtCodProduto.Text,lblNomeProduto.Caption,edtQuantidade.Text,Copy(edtValorUnitario.Text,4,40));
 
  SomaValores;

  edtCodProduto.Clear;
  edtQuantidade.Clear;
  lblNomeProduto.Caption := '';
  edtValorUnitario.Text := '';
  edtCodProduto.SetFocus;

end;

end.
