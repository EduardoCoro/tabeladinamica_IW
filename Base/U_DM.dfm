inherited DM: TDM
  Width = 763
  object FDQUsuario: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from usuario where login = :login  and senha = :senha')
    Left = 222
    Top = 88
    ParamData = <
      item
        Position = 1
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object DSPUsuario: TDataSetProvider
    DataSet = FDQUsuario
    Left = 222
    Top = 146
  end
  object CDSUsuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SENHA'
        ParamType = ptInput
      end>
    ProviderName = 'DSPUsuario'
    Left = 222
    Top = 205
    object CDSUsuarioid_usuario: TLargeintField
      FieldName = 'id_usuario'
      Required = True
    end
    object CDSUsuarionome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object CDSUsuariologin: TStringField
      FieldName = 'login'
      Required = True
      Size = 50
    end
    object CDSUsuariosenha: TStringField
      FieldName = 'senha'
      Required = True
      Size = 50
    end
  end
  object MainMenuSistema: TMainMenu
    Left = 80
    Top = 88
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Paciente1: TMenuItem
        Caption = 'Paciente'
      end
      object Profissional1: TMenuItem
        Caption = 'Profissional'
      end
      object Profissional2: TMenuItem
        Caption = 'Tabelas Auxiliares'
        OnClick = Profissional2Click
        object Logradouros1: TMenuItem
          Caption = 'Logradouros'
          OnClick = Logradouros1Click
        end
        object Outros1: TMenuItem
          Caption = 'Outros'
        end
      end
    end
    object Consulta1: TMenuItem
      Caption = 'Consulta'
    end
    object Consulta2: TMenuItem
      Caption = 'Informe'
    end
    object Help1: TMenuItem
      Caption = 'Help'
    end
    object Help2: TMenuItem
      Caption = 'Utilit'#225'rios'
    end
  end
  object CDSParametrosConsulta: TClientDataSet
    PersistDataPacket.Data = {
      A60000009619E0BD010000001800000005000000000003000000A60002494408
      00010000000000084E6F6D65466F726D01004900000001000557494454480200
      020064000C4E6F6D65436F6E74726F6C65010049000000010005574944544802
      00020064000C5469706F436F6E74726F6C650100490000000100055749445448
      0200020064000D56616C6F72436F6E74726F6C65010049000000010005574944
      54480200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 160
    object CDSParametrosConsultaID: TLargeintField
      FieldName = 'ID'
    end
    object CDSParametrosConsultaNomeForm: TStringField
      FieldName = 'NomeForm'
      Size = 100
    end
    object CDSParametrosConsultaNomeControle: TStringField
      FieldName = 'NomeControle'
      Size = 100
    end
    object CDSParametrosConsultaTipoControle: TStringField
      FieldName = 'TipoControle'
      Size = 100
    end
    object CDSParametrosConsultaValorControle: TStringField
      FieldName = 'ValorControle'
      Size = 100
    end
  end
end
