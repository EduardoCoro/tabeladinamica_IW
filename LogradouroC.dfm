inherited TLogradouroC: TTLogradouroC
  DesignLeft = 2
  DesignTop = 2
  object cbAtivo: TIWDBCheckBox [6]
    Left = 152
    Top = 184
    Width = 121
    Height = 21
    Caption = 'Ativo'
    Editable = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    AutoEditable = False
    DataField = 'ATIVO'
    DataSource = DSCadastro
    FriendlyName = 'cbAtivo'
    ValueChecked = 'true'
    ValueUnchecked = 'false'
  end
  object edCodLog: TIWDBEdit [7]
    Left = 152
    Top = 232
    Width = 200
    Height = 32
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'edCodLog'
    SubmitOnAsyncEvent = True
    AutoEditable = False
    DataField = 'COD_LOG'
    DataSource = DSCadastro
    PasswordPrompt = False
  end
  object edNome: TIWDBEdit [8]
    Left = 152
    Top = 296
    Width = 320
    Height = 32
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'edNome'
    MaxLength = 100
    SubmitOnAsyncEvent = True
    AutoEditable = False
    DataField = 'NOME'
    DataSource = DSCadastro
    PasswordPrompt = False
  end
  inherited DSCadastro: TDataSource
    DataSet = TDMPrincipal.cdsLogradouroC
  end
end
