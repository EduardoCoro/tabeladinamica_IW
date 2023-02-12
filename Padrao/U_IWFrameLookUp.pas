unit U_IWFrameLookUp;

interface

uses
  SysUtils, Classes, Controls, Forms,
  IWVCLBaseContainer, IWColor, IWContainer, IWRegion, IWHTMLContainer,
  IWHTML40Container, IWCompButton, IWCompEdit, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompGrids, IWDBGrids, Data.DB, Datasnap.DBClient,
  IWDBStdCtrls;

type
  TIWFrameLookUp = class(TFrame)
    IWFrameRegion: TIWRegion;
    IWDBGridLista: TIWDBGrid;
    IWRegionTopoFrame: TIWRegion;
    IWButtonFrameFechar: TIWButton;
    DataSourceFrame: TDataSource;
    IWRegionCampo: TIWRegion;
    IWEditParFrame: TIWEdit;
    IWDBEditCampo: TIWDBEdit;
    IWButtonFiltrarFrame: TIWButton;
    IWRegionGeral: TIWRegion;
    procedure IWButtonFiltrarFrameAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure IWButtonFrameFecharAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure IWDBGridListaColumns0AsyncClick(Sender: TObject;
      EventParams: TStringList; const AData: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation


{$R *.dfm}

procedure TIWFrameLookUp.IWButtonFiltrarFrameAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
   TIWDBGridColumn(IWDBGridLista.Columns.Items[0]).LinkField:=
          TClientDataset(DataSourceFrame.DataSet).Fields[0].FieldName;
   TIWDBGridColumn(IWDBGridLista.Columns.Items[0]).DataField:=
          TClientDataset(DataSourceFrame.DataSet).Fields[1].FieldName;
   TIWDBGridColumn(IWDBGridLista.Columns.Items[0]).OnAsyncClick:=
            IWDBGridListaColumns0AsyncClick;

   TClientDataset(DataSourceFrame.DataSet).Close;
   if TClientDataset(DataSourceFrame.DataSet).Params.Count = 1 then
      begin
         TClientDataset(DataSourceFrame.DataSet).Params[0].AsString:=
         IWEditParFrame.Text + '%';
      end;
   TClientDataset(DataSourceFrame.DataSet).Open;

   IWRegionGeral.Visible:=True;
   IWFrameRegion.Height:=
          (TClientDataset(DataSourceFrame.DataSet).RecordCount * 30) + 30;
   IWDBGridLista.Visible:=True;
   IWDBGridLista.RepaintControl;
end;

procedure TIWFrameLookUp.IWButtonFrameFecharAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
   IWFrameRegion.Height:=30;
   IWFrameRegion.Width:=50;
   IWRegionGeral.Visible:=True;
   IWDBGridLista.Visible:=False;
end;

procedure TIWFrameLookUp.IWDBGridListaColumns0AsyncClick(Sender: TObject;
  EventParams: TStringList; const AData: string);
begin
   TClientDataset(DataSourceFrame.DataSet).Locate(
      TClientDataset(DataSourceFrame.DataSet).Fields[0].FieldName, AData, []);
   TClientDataset(IWDBEditCampo.DataSource.DataSet).Edit;
   TClientDataset(IWDBEditCampo.DataSource.DataSet).FieldByName(IWDBEditCampo.DataField).Value:=
         TClientDataset(DataSourceFrame.DataSet).Fields[1].AsString;
end;

end.
