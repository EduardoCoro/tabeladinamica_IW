inherited TDMPrincipal: TTDMPrincipal
  inherited FDConnection: TFDConnection
    Params.Strings = (
      'Database=FOCUS'
      'User_Name=sa'
      'Password=01'
      'Server=192.168.1.172'
      'DriverID=MSSQL')
  end
  object qLogradouro: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'Select * from focus.dbo.logradouros where nome like :nome')
    Left = 56
    Top = 104
    ParamData = <
      item
        Position = 1
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object dspLogradouro: TDataSetProvider
    DataSet = qLogradouro
    Left = 56
    Top = 168
  end
  object cdsLogradouro: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspLogradouro'
    Left = 56
    Top = 240
    object cdsLogradouroCOD_LOG: TIntegerField
      Tag = 10
      FieldName = 'COD_LOG'
    end
    object cdsLogradouroNOME: TStringField
      Tag = 65
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object cdsLogradouroATIVO: TBooleanField
      Tag = 20
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
    end
  end
  object qLogradouroC: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'select L.* From Focus.dbo.Logradouros L where L.cod_log = :cod_l' +
        'og')
    Left = 168
    Top = 104
    ParamData = <
      item
        Position = 1
        Name = 'COD_LOG'
        DataType = ftLargeint
        ParamType = ptInput
      end>
  end
  object dspLogradouroC: TDataSetProvider
    DataSet = qLogradouroC
    Left = 168
    Top = 176
  end
  object cdsLogradouroC: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftLargeint
        Name = 'COD_LOG'
        ParamType = ptInput
      end>
    ProviderName = 'dspLogradouroC'
    Left = 168
    Top = 240
    object cdsLogradouroCCOD_LOG: TIntegerField
      FieldName = 'COD_LOG'
    end
    object cdsLogradouroCNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object cdsLogradouroCATIVO: TBooleanField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
    end
  end
end
