unit U_DM;

interface

uses
  System.SysUtils, System.Classes, U_DMPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSSQLDef,
  FireDAC.Comp.UI, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, Datasnap.DBClient,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Datasnap.Provider, FireDAC.Comp.DataSet, IWAppForm,  IWApplication,

  IWBaseControl, IWBaseHTMLControl, IWControl, IWCompButton, IWCompMenu,
  IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, System.Generics.Collections,
  Vcl.Menus;

type
  TDM = class(TDMPadrao)
    FDQUsuario: TFDQuery;
    DSPUsuario: TDataSetProvider;
    CDSUsuario: TClientDataSet;
    CDSUsuarioid_usuario: TLargeintField;
    CDSUsuarionome: TStringField;
    CDSUsuariologin: TStringField;
    CDSUsuariosenha: TStringField;
    MainMenuSistema: TMainMenu;
    Cadastros1: TMenuItem;
    CDSParametrosConsulta: TClientDataSet;
    CDSParametrosConsultaID: TLargeintField;
    CDSParametrosConsultaNomeForm: TStringField;
    CDSParametrosConsultaNomeControle: TStringField;
    CDSParametrosConsultaTipoControle: TStringField;
    CDSParametrosConsultaValorControle: TStringField;
    Paciente1: TMenuItem;
    Profissional1: TMenuItem;
    Profissional2: TMenuItem;
    Logradouros1: TMenuItem;
    Consulta1: TMenuItem;
    Consulta2: TMenuItem;
    Help1: TMenuItem;
    Help2: TMenuItem;
    Outros1: TMenuItem;
    procedure Logradouros1Click(Sender: TObject);
    procedure Profissional2Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  DM: TDM;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ServerController, Logradouro, Saude;

{$R *.dfm}

procedure TDM.Logradouros1Click(Sender: TObject);
begin
  inherited;
  US.ExibePagina(TTLogradouro, TTSaude);
end;

procedure TDM.Profissional2Click(Sender: TObject);
begin
  inherited;
   US.ExibePagina(TTLogradouro, TTSaude);
end;

end.
