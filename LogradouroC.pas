unit LogradouroC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_IWFormPadraoCadastro, Data.DB,
  Vcl.Menus, IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, IWCompEdit, IWCompText,
  IWCompMenu, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompButton, IWCompCheckbox, IWDBStdCtrls;

type
  TTLogradouroC = class(TIWFormPadraoCadastro)
    cbAtivo: TIWDBCheckBox;
    edCodLog: TIWDBEdit;
    edNome: TIWDBEdit;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TLogradouroC: TTLogradouroC;

implementation

{$R *.dfm}

uses ServerController, DMPrincipal;

procedure TTLogradouroC.IWAppFormCreate(Sender: TObject);
begin
  CDSCadastro:=US.DMprincipal.cdsLogradouroC;
  inherited;

end;

procedure TTLogradouroC.IWAppFormRender(Sender: TObject);
begin
  MenuReal:=US.DM.MainMenuSistema;
  inherited;

end;

end.
