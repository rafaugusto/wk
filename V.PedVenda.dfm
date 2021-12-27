object FrPedVenda: TFrPedVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pedido de Venda'
  ClientHeight = 660
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblNumPedido: TLabel
    Left = 338
    Top = 163
    Width = 84
    Height = 16
    Caption = 'lblNumPedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCliente: TLabel
    Tag = 3
    Left = 857
    Top = 159
    Width = 72
    Height = 18
    Alignment = taRightJustify
    Caption = 'lblCliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object sgListaItens: TStringGrid
    Left = 338
    Top = 205
    Width = 591
    Height = 382
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goFixedRowDefAlign]
    TabOrder = 0
    OnKeyDown = sgListaItensKeyDown
  end
  object Panel1: TPanel
    Left = 338
    Top = 180
    Width = 591
    Height = 25
    BevelOuter = bvNone
    Color = clGray
    ParentBackground = False
    TabOrder = 1
    object Label3: TLabel
      Left = 6
      Top = 7
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 70
      Top = 7
      Width = 38
      Height = 13
      Caption = 'Produto'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 410
      Top = 7
      Width = 56
      Height = 13
      Caption = 'Quantidade'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 474
      Top = 7
      Width = 56
      Height = 13
      Caption = 'Vlr. Unit'#225'rio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label8: TLabel
      Left = 540
      Top = 7
      Width = 43
      Height = 13
      Caption = 'Vlr. Total'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 71
    Top = 163
    Width = 253
    Height = 458
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 41
      Top = 27
      Width = 89
      Height = 13
      Caption = 'C'#243'digo do Produto'
    end
    object Label2: TLabel
      Left = 41
      Top = 113
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object lblNomeProduto: TLabel
      Left = 41
      Top = 69
      Width = 99
      Height = 14
      Caption = 'lblNomeProduto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 41
      Top = 163
      Width = 64
      Height = 13
      Caption = 'Valor Unit'#225'rio'
    end
    object edtCodProduto: TEdit
      Left = 41
      Top = 43
      Width = 167
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      OnExit = edtCodProdutoExit
    end
    object edtQuantidade: TEdit
      Left = 41
      Top = 129
      Width = 73
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
    object btnAdicionarItem: TButton
      Left = 41
      Top = 223
      Width = 167
      Height = 37
      Caption = 'Adicionar Item'
      TabOrder = 2
      OnClick = btnAdicionarItemClick
    end
    object Button2: TButton
      Left = 41
      Top = 401
      Width = 98
      Height = 49
      Caption = 'Gravar Pedido'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 145
      Top = 401
      Width = 63
      Height = 49
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = Button3Click
    end
    object btnCancelarAlteracao: TButton
      Left = 41
      Top = 262
      Width = 167
      Height = 29
      Caption = 'Cancelar Altera'#231#227'o'
      TabOrder = 5
      TabStop = False
      OnClick = btnCancelarAlteracaoClick
    end
    object edtValorUnitario: TEdit
      Left = 41
      Top = 179
      Width = 73
      Height = 21
      NumbersOnly = True
      TabOrder = 6
    end
  end
  object Panel3: TPanel
    Left = 338
    Top = 570
    Width = 591
    Height = 51
    BevelOuter = bvNone
    Color = clGray
    ParentBackground = False
    TabOrder = 3
    object Label4: TLabel
      Left = 521
      Top = 5
      Width = 51
      Height = 13
      Caption = 'Valor Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblValorTotal: TLabel
      Left = 526
      Top = 20
      Width = 46
      Height = 25
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PageControl1: TPageControl
    Left = 71
    Top = 38
    Width = 858
    Height = 105
    ActivePage = TabSheet1
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = 'Novo Pedido'
      object Label9: TLabel
        Left = 12
        Top = 14
        Width = 84
        Height = 13
        Caption = 'C'#243'digo do Cliente'
      end
      object edtCliente: TEdit
        Left = 12
        Top = 30
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
      object Button1: TButton
        Left = 140
        Top = 28
        Width = 75
        Height = 25
        Caption = 'Localizar'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Carregar Pedido'
      ImageIndex = 1
      object Label10: TLabel
        Left = 12
        Top = 14
        Width = 87
        Height = 13
        Caption = 'N'#250'mero do Pedido'
      end
      object edtNumPedido: TEdit
        Left = 12
        Top = 30
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
      object Button4: TButton
        Left = 139
        Top = 28
        Width = 120
        Height = 25
        Caption = 'Carregar'
        TabOrder = 1
        OnClick = Button4Click
      end
      object btnExcluirPedido: TButton
        Left = 274
        Top = 28
        Width = 85
        Height = 25
        Caption = 'Excluir Pedido'
        TabOrder = 2
        TabStop = False
        Visible = False
        OnClick = btnExcluirPedidoClick
      end
    end
  end
end
