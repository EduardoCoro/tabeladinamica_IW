object IWFrameLookUp: TIWFrameLookUp
  Left = 0
  Top = 0
  Width = 320
  Height = 195
  TabOrder = 0
  object IWFrameRegion: TIWRegion
    Left = 0
    Top = 0
    Width = 320
    Height = 195
    RenderInvisibleControls = True
    Align = alClient
    BorderOptions.NumericWidth = 0
    ClipRegion = False
    StyleRenderOptions.RenderPosition = False
    object IWRegionGeral: TIWRegion
      Left = 0
      Top = 30
      Width = 320
      Height = 165
      Visible = False
      RenderInvisibleControls = True
      Align = alClient
      object IWDBGridLista: TIWDBGrid
        Left = 1
        Top = 31
        Width = 318
        Height = 133
        Visible = False
        Align = alClient
        Css = 'Table Responsive'
        BorderColors.Color = clNone
        BorderColors.Light = clNone
        BorderColors.Dark = clNone
        BGColor = clNone
        BorderSize = 1
        BorderStyle = tfDefault
        Caption = 'IWDBGridLista'
        CellPadding = 0
        CellSpacing = 0
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FrameBuffer = 40
        Lines = tlAll
        UseFrame = False
        UseSize = True
        ScrollToCurrentRow = False
        Columns = <
          item
            Alignment = taLeftJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = 'Table'
            BlobCharLimit = 0
            CompareHighlight = hcNone
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
            OnAsyncClick = IWDBGridListaColumns0AsyncClick
          end>
        DataSource = DataSourceFrame
        FooterRowCount = 0
        FriendlyName = 'IWDBGridLista'
        FromStart = True
        HighlightColor = clNone
        HighlightRows = False
        Options = []
        RefreshMode = rmAutomatic
        RowLimit = 0
        RollOver = True
        RowClick = False
        RollOverColor = clNone
        RowHeaderColor = clNone
        RowAlternateColor = clNone
        RowCurrentColor = clNone
        ExplicitHeight = 30
      end
      object IWRegionTopoFrame: TIWRegion
        Left = 1
        Top = 1
        Width = 318
        Height = 30
        RenderInvisibleControls = True
        Align = alTop
        BorderOptions.NumericWidth = 0
        ClipRegion = False
        object IWButtonFrameFechar: TIWButton
          Left = 268
          Top = 0
          Width = 50
          Height = 30
          Align = alRight
          Css = 'TIWButton'
          Caption = 'Fechar'
          Color = clBtnFace
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          FriendlyName = 'IWButtonPesqFrame'
          OnAsyncClick = IWButtonFrameFecharAsyncClick
          ExplicitLeft = 267
          ExplicitTop = 3
        end
        object IWEditParFrame: TIWEdit
          Left = 0
          Top = 0
          Width = 268
          Height = 30
          Align = alClient
          Css = 'TIWEdit'
          StyleRenderOptions.RenderBorder = False
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          FriendlyName = 'IWEditParFrame'
          SubmitOnAsyncEvent = True
          ExplicitLeft = 44
          ExplicitTop = 3
          ExplicitWidth = 220
        end
      end
    end
    object IWRegionCampo: TIWRegion
      Left = 0
      Top = 0
      Width = 320
      Height = 30
      RenderInvisibleControls = True
      Align = alTop
      StyleRenderOptions.RenderPosition = False
      StyleRenderOptions.RenderAbsolute = False
      object IWDBEditCampo: TIWDBEdit
        Left = 1
        Top = 1
        Width = 268
        Height = 28
        Align = alClient
        StyleRenderOptions.RenderBorder = False
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'IWDBEditCampo'
        SubmitOnAsyncEvent = True
        AutoEditable = False
        PasswordPrompt = False
        ExplicitLeft = 3
        ExplicitTop = -4
      end
      object IWButtonFiltrarFrame: TIWButton
        Left = 269
        Top = 1
        Width = 50
        Height = 28
        Align = alRight
        Css = 'TIWButton'
        Caption = 'Filtrar'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'IWButtonFiltrarFrame'
        OnAsyncClick = IWButtonFiltrarFrameAsyncClick
        ExplicitLeft = 265
        ExplicitTop = 5
      end
    end
  end
  object DataSourceFrame: TDataSource
    Left = 72
    Top = 72
  end
end
