object FrCliente: TFrCliente
  Left = 0
  Top = 0
  Caption = 'Cliente'
  ClientHeight = 443
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 112
    Top = 112
    Width = 136
    Height = 13
    Caption = 'Informe o c'#243'digo do Cliente:'
  end
  object lblCliente: TLabel
    Left = 112
    Top = 160
    Width = 43
    Height = 13
    Caption = 'lblCliente'
  end
  object Label2: TLabel
    Left = 112
    Top = 24
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 112
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Label3'
  end
  object edtCodCliente: TEdit
    Left = 112
    Top = 131
    Width = 121
    Height = 21
    TabOrder = 0
    OnExit = edtCodClienteExit
  end
  object Button1: TButton
    Left = 112
    Top = 232
    Width = 121
    Height = 41
    Caption = 'Pedido de Venda'
    TabOrder = 1
    OnClick = Button1Click
  end
end
