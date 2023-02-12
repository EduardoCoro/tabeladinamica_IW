unit U_DMPadrao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSSQLDef, FireDAC.Comp.UI,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, MidasLib, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.Provider,
  FireDAC.Comp.DataSet, Datasnap.DBClient;

type
  TDMPadrao = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    CDSChavePrimaria: TClientDataSet;
    CDSChavePrimariaID_ChavePrimaria: TLargeintField;
    CDSChavePrimariaCampo: TStringField;
    CDSChavePrimariaUltimoNumero: TLargeintField;
    FDQChavePrimaria: TFDQuery;
    DSPChavePrimaria: TDataSetProvider;
    procedure FDConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    function TrataErro(MsgErro: string): string;
    function RetornaID(NomeCampo: string): int64;
  end;

var
  DMPadrao: TDMPadrao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMPadrao.FDConnectionBeforeConnect(Sender: TObject);
begin
   //FDConnection.Params.LoadFromFile('LocalBanco.TXT');
end;

function TDMPadrao.RetornaID(NomeCampo: string): int64;
begin
   CDSChavePrimaria.Close;
   CDSChavePrimaria.Params[0].AsString:=NomeCampo;
   CDSChavePrimaria.Open;
   CDSChavePrimaria.Edit;
   CDSChavePrimariaUltimoNumero.AsLargeInt:=
           CDSChavePrimariaUltimoNumero.AsLargeInt + 1;
   CDSChavePrimaria.Post;
   if CDSChavePrimaria.ApplyUpdates(0) > 0 then
      begin
         RetornaID(NomeCampo);
      end
   else
      begin
         Result:=CDSChavePrimariaUltimoNumero.AsLargeInt;
      end;
end;

function TDMPadrao.TrataErro(MsgErro: string): string;
var Mensagem, Msg: string;
    Pos1, Pos2: Integer;
    ArqErro : TStringList;
begin
   Msg := '';
   If Pos(UpperCase('is not a valid date'), UpperCase(MsgErro)) <> 0 then
      Msg := 'Data inv�lida, proceda a corre��o.'
   else if Pos(UpperCase('must have a value'), UpperCase(MsgErro)) <> 0 then
      begin
         Pos1 := Pos('''', MsgErro);
         Mensagem := MsgErro;
         Delete(Mensagem, Pos1, 1);
         Pos2 := Pos('''', Mensagem);
         Mensagem := copy(MsgErro, Pos1 + 1, Pos2 - Pos1);
         Msg := '� obrigat�rio o preenchimento do campo ' + Mensagem + '.';
      end
   else if Pos(UpperCase('INI'), UpperCase(MsgErro)) <> 0 then
      begin
         Pos1 := Pos('INI', MsgErro) + 3;
         Pos2 := Pos('FIM', MsgErro);
         Mensagem := copy(MsgErro, Pos1, Pos2 - Pos1);
         Msg := Mensagem;
      end
   else If Pos(UpperCase('key violation'), UpperCase(MsgErro)) <> 0 then
      Msg := 'Houve viola��o de Chave.  Registro j� incluido.'
   else If Pos(UpperCase('Input value'), UpperCase(MsgErro)) <> 0 then
      Msg := 'Campo preenchido com valor n�o v�lido. Fa�a a corre��o.'
   else If Pos(UpperCase('is not a valid time'), UpperCase(MsgErro)) <> 0 then
      Msg := 'Hora inv�lida, proceda a corre��o.'
   else If Pos(UpperCase('is not a valid float'), UpperCase(MsgErro)) <> 0 then
      begin
         Pos1 := Pos('''', MsgErro);
         Mensagem := MsgErro;
         Delete(Mensagem, Pos1, 1);
         Pos2 := Pos('''', Mensagem);
         Mensagem := copy(MsgErro, Pos1 + 1, Pos2 - Pos1);
         Msg := 'O valor  ' + Mensagem + ' n�o � v�lido.';
      end
   else If Pos(UpperCase('field value required'), UpperCase(MsgErro)) <> 0 then
      begin
         Pos1 := Pos('column ', MsgErro) + 7;
         Pos2 := Pos(',', MsgErro);
         Mensagem := copy(MsgErro, Pos1, Pos2 - Pos1);
         Msg := 'O campo ' + Mensagem + ' deve ser preenchido.'
      end
   else If Pos(UpperCase(
      'THE DELETE STATEMENT CONFLICTED WITH THE REFERENCE CONSTRAINT'),
      UpperCase(MsgErro)) <> 0 then
      begin
         Msg := 'N�o pode ser exclu�do, pois outros cadastros dependem deste.';
      end
   else If Pos(UpperCase('Connection cannot be nil'), UpperCase(MsgErro)) <> 0 then
      begin
         Msg := 'A conex�o com servi�o falhou.';
      end
   else If Pos(UpperCase('RECORD NOT FOUND OR CHANGED BY ANOTHER USER'), UpperCase(MsgErro)) <> 0 then
      begin
         Msg := 'Chegou tarde..... o registro j� foi alterado ou exclu�do.';
      end
   else If Pos(UpperCase('cannot delete master record with details'), UpperCase(MsgErro)) <> 0 then
      begin
         Msg := 'N�o pode excluir, pois outros registros dependem dele.';
      end
   else If Pos(UpperCase('xyz bla bla'), UpperCase(MsgErro)) <> 0 then
      begin
         Msg := 'Eroo de blabla bla.';
      end
   else If Pos(UpperCase('CANNOT INSERT DUPLICATE KEY ROW IN OBJECT'), UpperCase(MsgErro)) <> 0 then
      begin
         Msg := 'N�o pode haver registros duplicados.';
      end
   else
      Msg := 'Ocorreu o seguinte erro: ' + UpperCase(MsgErro);
   Result := Msg;

end;

end.
