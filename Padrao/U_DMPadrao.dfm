object DMPadrao: TDMPadrao
  OldCreateOrder = True
  Height = 409
  Width = 752
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=FOCUS'
      'User_Name=sa'
      'Password=FocusAdmin7539#@'
      'Server=187.103.148.69\FOCUSWEB,1510'
      'DriverID=MSSQL')
    LoginPrompt = False
    BeforeConnect = FDConnectionBeforeConnect
    Left = 40
    Top = 16
  end
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 160
    Top = 16
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 288
    Top = 16
  end
  object CDSChavePrimaria: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CAMPO'
        ParamType = ptInput
      end>
    ProviderName = 'DSPChavePrimaria'
    Left = 668
    Top = 14
    object CDSChavePrimariaID_ChavePrimaria: TLargeintField
      FieldName = 'ID_ChavePrimaria'
      Required = True
    end
    object CDSChavePrimariaCampo: TStringField
      FieldName = 'Campo'
      Required = True
      Size = 50
    end
    object CDSChavePrimariaUltimoNumero: TLargeintField
      FieldName = 'UltimoNumero'
      Required = True
    end
  end
  object FDQChavePrimaria: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'Select ChavePrimaria.*'
      'From ChavePrimaria'
      'Where Campo = :Campo')
    Left = 420
    Top = 16
    ParamData = <
      item
        Position = 1
        Name = 'CAMPO'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object DSPChavePrimaria: TDataSetProvider
    DataSet = FDQChavePrimaria
    Left = 540
    Top = 14
  end
end
