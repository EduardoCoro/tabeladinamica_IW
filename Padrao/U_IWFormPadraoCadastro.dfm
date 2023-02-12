inherited IWFormPadraoCadastro: TIWFormPadraoCadastro
  DesignLeft = 2
  DesignTop = 2
  inherited IWButtonVoltar: TIWButton
    OnAsyncClick = IWButtonVoltarAsyncClick
  end
  inherited IWMenu: TIWMenu
    ExplicitLeft = 0
    ExplicitTop = 8
    ExplicitWidth = 800
  end
  object IWButtonSalvar: TIWButton [4]
    Left = 523
    Top = 80
    Width = 120
    Height = 30
    Css = 'btn btn-success'
    Caption = 'Salvar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWButtonPesquisar'
    TabOrder = 2
    OnAsyncClick = IWButtonSalvarAsyncClick
  end
  object IWButtonCancelar: TIWButton [5]
    Left = 656
    Top = 80
    Width = 120
    Height = 30
    Css = 'btn btn-danger'
    Caption = 'Cancelar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWButtonPesquisar'
    TabOrder = 3
    OnAsyncClick = IWButtonCancelarAsyncClick
  end
  object DSCadastro: TDataSource
    Left = 392
    Top = 80
  end
end
