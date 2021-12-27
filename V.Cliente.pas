unit V.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrCliente = class(TForm)
    Label1: TLabel;
    edtCodCliente: TEdit;
    lblCliente: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrCliente: TFrCliente;

implementation

{$R *.dfm}

uses V.PedVenda, M.DM, C.Cliente;

procedure TFrCliente.Button1Click(Sender: TObject);
begin
  FrPedVenda := TFrPedVenda.Create(self);
  FrPedVenda.lblCliente.Caption := lblCliente.Caption;
  FrPedVenda.lblCliente.Tag := StrToInt(edtCodCliente.Text);
  FrPedVenda.ShowModal;
end;

procedure TFrCliente.edtCodClienteExit(Sender: TObject);
var
buscaCliente:TCliente;
begin
  {DM.QueryCliente.ParamByName('CODCLIENTE').AsString := edtCodCliente.Text;
  DM.QueryCliente.Open;
  lblCliente.Caption := DM.QueryCliente.FieldByName('NOME').AsString;
  DM.QueryCliente.Close;}

  buscaCliente := TCliente.Create;
  lblCliente.Caption := buscaCliente.BuscaCliente(edtCodCliente.Text);

//  lblCliente.Caption := C.Cliente.BuscaCliente(edtCodCliente.Text);
end;

procedure TFrCliente.FormShow(Sender: TObject);
begin
  lblCliente.Caption := '';
end;

end.
