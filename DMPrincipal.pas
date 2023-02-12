unit DMPrincipal;

interface

uses
  System.SysUtils, System.Classes, U_DMPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Datasnap.Provider, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DB,
  Datasnap.DBClient, FireDAC.Comp.UI, FireDAC.Phys.ODBCBase;

type
  TTDMPrincipal = class(TDMPadrao)
    qLogradouro: TFDQuery;
    dspLogradouro: TDataSetProvider;
    cdsLogradouro: TClientDataSet;
    qLogradouroC: TFDQuery;
    dspLogradouroC: TDataSetProvider;
    cdsLogradouroC: TClientDataSet;
    cdsLogradouroCNOME: TStringField;
    cdsLogradouroCATIVO: TBooleanField;
    cdsLogradouroNOME: TStringField;
    cdsLogradouroATIVO: TBooleanField;
    cdsLogradouroCOD_LOG: TIntegerField;
    cdsLogradouroCCOD_LOG: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TDMPrincipal: TTDMPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
