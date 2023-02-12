unit U_IWFormPadrao;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompButton,
  IWCompMenu, IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, Vcl.Menus, IWCompText,
  System.Generics.Collections, ServerController, IWDBGrids, Datasnap.DBClient,
  IWCompEdit;

type
  TIWFormPadrao = class(TIWAppForm)
    IWButtonVoltar: TIWButton;
    IWTemplateProcessorHTML: TIWTemplateProcessorHTML;
    IWMenu: TIWMenu;
    IWTextMenuNav: TIWText;
    IWEDITID: TIWEdit;
    MainMenuNav: TMainMenu;
    procedure IWButtonVoltarAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
  private


  public
    MenuReal  : TMainMenu;
    //procedure CriarColunasGrid(IWDBGridConsulta: TIWDBGrid; RegistrosPagina  : integer);
    //procedure IWDBGridConsultaColumns0Click(ASender: TObject; const AValue: string);

    procedure CriaMenuNAV;
    procedure ExibeMenu(EventParams: TStringList);
    procedure ProcessarChamadasAjax;

    procedure ExecutaMetodo(Classe: TObject; NomeMetodo: string);
    procedure RedirecionaForm(EventParams: TStringList);
  end;

  type
    TExec = procedure of object;

implementation

{$R *.dfm}

uses Data.DB, Vcl.Graphics ;

procedure TIWFormPadrao.ExecutaMetodo(Classe: TObject; NomeMetodo: string);
var
  Routine: TMethod;
  Exec: TExec;
begin
  Routine.Data := Pointer(Classe);
  Routine.Code := Classe.MethodAddress(NomeMetodo);
  if NOT Assigned(Routine.Code) then
    Exit;
  Exec := TExec(Routine);
  Exec;
end;

procedure TIWFormPadrao.RedirecionaForm(EventParams: TStringList);
var
  sl: TStringList;
  s : string;
begin
   sl := TStringList.Create;
   sl.StrictDelimiter := True;
   sl.CommaText := EventParams.Values['Params'];
   US.GLBID:=sl.ValueFromIndex[0].ToInt64;
   ExecutaMetodo(Self, 'Redireciona');
   sl.Free;
end;

procedure TIWFormPadrao.CriaMenuNAV;
var
  StrMenuNAV : TStringList;
  i, j, k : integer;
begin                                                                                      //#006400
   StrMenuNAV:=TStringList.Create;
   StrMenuNAV.Clear;
   StrMenuNAV.Add('<div alingn="left">');
   StrMenuNAV.Add('<nav class="navbar navbar-inverse">');
       StrMenuNAV.Add('<div style="width: 100%; min-width: 320px; height: auto; background: black;">');
         StrMenuNAV.Add('<div class="navbar-header">');
           StrMenuNAV.Add('<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbarDelphi">');
             StrMenuNAV.Add('<span class="icon-bar"></span>');
             StrMenuNAV.Add('<span class="icon-bar"></span>');
             StrMenuNAV.Add('<span class="icon-bar"></span>');
           StrMenuNAV.Add('</button>');
//           StrMenuNAV.Add('<a style="background-color:green;" class="navbar-brand" href="#">www.resolved.com.br</a>');
//           StrMenuNAV.Add('<img class="img-thumbnail" src="../img/ItSoluction.png"  alt="Cinque Terre" width="250" height="50">');

         StrMenuNAV.Add('</div>');
         StrMenuNAV.Add('<div class="collapse navbar-collapse" id="myNavbarDelphi" style="min-width: 360px;">');

             StrMenuNAV.Add('<ul class="nav navbar-nav" style="font: 18px arial, sans-serif; text-align: left; text-indent: 70px">');
                         for i := 0 to MainMenuNav.Items.Count - 1 do
                           begin
                              StrMenuNAV.Add('<li class="dropdown">');
                                  StrMenuNAV.Add('<a OnClick="javascript:cliquemenu(' +
                                                  QuotedStr(MainMenuNav.Items[i].Name) +
                                                  ');"');
                                  StrMenuNAV.Add(' class="dropdown-toggle" data-toggle="dropdown" href="#">');
                                  StrMenuNAV.Add(MainMenuNav.Items[i].Caption);
                                  StrMenuNAV.Add('<span class="caret"></span></a>');

                                  if MainMenuNav.Items[i].Count > 0 then
                                     begin
                                         StrMenuNAV.Add('<ul class="dropdown-menu" style="font: 16px arial, sans-serif; text-align: left; text-indent: 50px">');
                                         for j := 0 to MainMenuNav.Items[i].Count - 1 do
                                           begin
                                              StrMenuNAV.Add('<li class="lili"><a OnClick="javascript:cliquemenu(' +
                                                             QuotedStr(MainMenuNav.Items[i].Items[j].Name) +
                                                             ');">' +
                                                             MainMenuNav.Items[i].Items[j].Caption +
                                                             '</a>');

                                              if MainMenuNav.Items[i].Items[j].Count > 0 then
                                                  begin
                                                      StrMenuNAV.Add('<ul class="dropdown-menu" style="font: 16px arial, sans-serif; text-align: left; text-indent: 50px">');
                                                      for k := 0 to MainMenuNav.Items[i].Items[j].Count - 1 do
                                                        begin
                                                           StrMenuNAV.Add('<li><a OnClick="javascript:cliquemenu(' +
                                                                          QuotedStr(MainMenuNav.Items[i].Items[j].Items[k].Name) +
                                                                          ');">' +
                                                                          MainMenuNav.Items[i].Items[j].Items[k].Caption +
                                                                          '</a></li>');
                                                        end;
                                                      StrMenuNAV.Add('</ul>');

                                                  end;
                                              StrMenuNAV.Add('</li>');
                                           end;
                                        StrMenuNAV.Add('</ul>');
                                     end;
                              StrMenuNAV.Add('</li>');
                           end;
             StrMenuNAV.Add('</ul>');

         StrMenuNAV.Add('</div>');
   StrMenuNAV.Add('</div></nav></div>');
   IWTextMenuNav.Text:=StrMenuNAV.Text;
   IWTextMenuNav.Align:=alClient;
end;

procedure TIWFormPadrao.ExibeMenu(EventParams: TStringList);
var
  OpcMenu : string;
begin
   OpcMenu:=EventParams.Values['parametro'];
   TMenuItem(MenuReal.Owner.FindComponent(OpcMenu)).Click;
end;

procedure TIWFormPadrao.ProcessarChamadasAjax;
  const
     jsTag = '<script language="javascript" type="text/javascript">%s</script>';
  var
     AjaxFunc : string;
begin
   AjaxFunc := 'function cliquemenu(vparam) {' +#13+
                'executeAjaxEvent("&parametro="+vparam, null,"' +
                UpperCase(Self.Name) + '.cliquemenu", false, null, false);'+#13+
                'return true;}'+#13;
   PageContext.ExtraHeader.Add(Format(jsTag, [AjaxFunc]));
   WebApplication.RegisterCallBack(UpperCase(Self.Name) + '.cliquemenu', ExibeMenu);
end;

procedure TIWFormPadrao.IWAppFormCreate(Sender: TObject);
begin
   MenuReal:=TMainMenu.Create(Self);
end;

procedure TIWFormPadrao.IWAppFormRender(Sender: TObject);
begin
   MainMenuNav:=Nil;
   MainMenuNav:=MenuReal;
   CriaMenuNAV;
   ProcessarChamadasAjax;
   US.AtribuirCSS;
end;

procedure TIWFormPadrao.IWButtonVoltarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
   US.ExibePaginaRetorno;
end;

end.
