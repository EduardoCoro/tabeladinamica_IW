unit Saude;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_IWFormPadrao, Vcl.Menus,
  IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, IWCompEdit, IWCompText,
  IWCompMenu, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompButton;

type
  TTSaude = class(TIWFormPadrao)
    procedure IWAppFormRender(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TSaude: TTSaude;

implementation

{$R *.dfm}

uses ServerController;

procedure TTSaude.IWAppFormRender(Sender: TObject);
begin
  MenuReal:=US.DM.MainMenuSistema;
  inherited;

end;

initialization
  TTSaude.SetAsMainForm;

end.
