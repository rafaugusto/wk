object DM: TDM
  OldCreateOrder = False
  Height = 369
  Width = 573
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=WK'
      'User_Name=root'
      'Password=bol*2908R'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 224
    Top = 32
  end
  object QueryBuscaProduto: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT DESCRICAO,PRECOVENDA FROM PRODUTOS'
      'WHERE CODIGO=:CODIGO')
    Left = 80
    Top = 96
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
      end>
  end
  object QueryGravaPedido: TFDQuery
    Connection = FDConnection1
    Left = 200
    Top = 96
  end
  object QueryCliente: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT NOME FROM CLIENTES'
      'WHERE CODIGO=:CODCLIENTE')
    Left = 304
    Top = 96
    ParamData = <
      item
        Name = 'CODCLIENTE'
        ParamType = ptInput
      end>
  end
  object QueryPedidos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT CLIENTES.NOME AS NOME_CLIENTE,PEDIDOS_GERAIS.COD_CLIENTE,' +
        'PEDIDOS_PRODUTOS.COD_PRODUTO,PRODUTOS.DESCRICAO AS NOMEPRODUTO,'
      'PEDIDOS_PRODUTOS.QUANTIDADE,PEDIDOS_PRODUTOS.VLR_UNITARIO'
      'FROM PEDIDOS_PRODUTOS'
      'JOIN PRODUTOS ON (PRODUTOS.CODIGO=PEDIDOS_PRODUTOS.COD_PRODUTO)'
      
        'JOIN PEDIDOS_GERAIS ON (PEDIDOS_GERAIS.NUMERO=PEDIDOS_PRODUTOS.N' +
        'UM_PEDIDO)'
      'JOIN CLIENTES ON (PEDIDOS_GERAIS.COD_CLIENTE=CLIENTES.CODIGO)'
      'WHERE NUM_PEDIDO=:NUMPEDIDO')
    Left = 392
    Top = 96
    ParamData = <
      item
        Name = 'NUMPEDIDO'
        ParamType = ptInput
      end>
  end
end
