unit U_GeradorTableHTML;

interface

uses
  Datasnap.DBClient, Data.DB, System.Classes, IWApplication;

type
  TGeradorTableHTML = Class
  private

  Public
      TotalRegPaginacao : integer;
      SobraPaginacao : integer;
      PosicaoFinal, PosicaoInicial : integer;
      function  CriarJSTabela(NomeTabela : string) : string;
      function  GerarTableHTML(
                              NomeTabela : string;
                              CDS: TClientDataSet;
                              QTDLinhaPagina: Integer;
                              Posicao: String): String;

      function GerarTableHTMLRedirecionaForm(
                              NomeTabela : string;
                              CDS: TClientDataSet;
                              QTDLinhaPagina: Integer;
                              Posicao: String): String;
  end;

implementation

uses
  System.SysUtils, Web.HTTPApp;

{ TGeradorTableHTML }

function TGeradorTableHTML.GerarTableHTML(
                                       NomeTabela : string;
                                       CDS : TClientDataSet;
                                       QTDLinhaPagina : Integer;
                                       Posicao : String) : String;
Var
  StrHTML : TStringList;
  i, z, j, NroLinha, RegAtual, Inc : integer;
  ValorStr, OnClick, NaoExibir : string;
begin
   StrHTML:=TStringList.Create;
   StrHTML.Add(
               '<script type="text/javascript">' +
                 ' var RegSelecionado = 0; ' +
                 'function SelReg(reg) { '        +
                 '  RegSelecionado = reg;' +
                 ' selLinha(); ' +
                 ' };' +
               '</script>'
              );

   StrHTML.Add('<div class="table-responsive">');
   StrHTML.Add('<table style="width: 100%;" id="' + NomeTabela +
                 '" class="table table-hover table-bordered table-condensed">');

   /////////  T�tulos de Colunas ///////////////////////////////////////////////
   StrHTML.Add('<thead>');
   StrHTML.Add('<tr>');
   for i := 0 to CDS.Fields.Count - 1 do
      begin
         if CDS.Fields[i].Tag > 0 then
            begin
               if CDS.Fields[i].Tag > 100 then
                  NaoExibir:='display:none;'
               else
                  NaoExibir:='';
               if CDS.Fields[i] is TDateField then
                  StrHTML.Add('<th style="text-align:center;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TSQLTimeStampField  then
                  StrHTML.Add('<th style="text-align:center;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TFloatField  then
                  StrHTML.Add('<th style="text-align:Right;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TFMTBCDField  then
                  StrHTML.Add('<th style="text-align:Right;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TCurrencyField  then
                  StrHTML.Add('<th style="text-align:Right;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TLargeintField  then
                  StrHTML.Add('<th style="text-align:Right;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TIntegerField  then
                  StrHTML.Add('<th style="text-align:Right;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TBCDField  then
                  StrHTML.Add('<th style="text-align:Right;' + NaoExibir + '">')
               else
                  StrHTML.Add('<th style="text-align:left;"' + NaoExibir + '">');
               StrHTML.Add(CDS.Fields[i].DisplayLabel + '</th>');
            end;
      end;
   StrHTML.Add('</tr>');
   StrHTML.Add('</thead>');
   /////////////////////////////////////////////////////////////////////////////

   /////////  Conte�do das Colunas /////////////////////////////////////////////
   StrHTML.Add('<tbody>');
   if (CDS.Active) then
      begin
         TotalRegPaginacao:=CDS.RecordCount;
         SobraPaginacao:=CDS.RecordCount - (CDS.RecordCount Div QTDLinhaPagina) * QTDLinhaPagina;
         if (Posicao = 'INICIO') then
            begin
              CDS.First;
            end
         else
         if (Posicao = 'PROXIMO') then
            begin
               if CDS.RecNo = TotalRegPaginacao then
                  CDS.RecNo:=CDS.RecNo
               else
                  CDS.RecNo:=PosicaoFinal + 1;
            end
//         else
//         if (Posicao = 'ANTERIOR') then
//            begin
//               if CDS.RecNo <= QTDLinhaPagina then
//                  CDS.RecNo:=1
//               else
//               if CDS.RecNo = TotalRegPaginacao then
//                  CDS.RecNo:=PosicaoFinal - (QTDLinhaPagina + SobraPaginacao - 1)
//               else
//                  CDS.RecNo:=PosicaoFinal - QTDLinhaPagina - 1;
//            end
         else
         if (Posicao = 'ANTERIOR') then
            begin
               if CDS.RecNo < TotalRegPaginacao then
                  CDS.MoveBy(- ((2 * QTDLinhaPagina) - 1))
               else
                  CDS.MoveBy(- ((1 * QTDLinhaPagina) + SobraPaginacao - 1));
            end
         else
         if (Posicao = 'FINAL') then
            begin
               CDS.RecNo:=CDS.RecordCount - SobraPaginacao + 1;
            end;

         PosicaoInicial:=CDS.RecNo;
         for z := 1 to QTDLinhaPagina do
            begin
               onClick:='onclick="selLinha(this, false);"';
               StrHTML.Add('<tr style="cursor: pointer;"' + OnClick + '>');
               for j := 0 to CDS.Fields.Count - 1 do
                  begin
                     if CDS.Fields[j].Tag > 0 then
                        begin
                           if CDS.Fields[j].Tag > 100 then
                              NaoExibir:='display:none;'
                           else
                              NaoExibir:='';
                           if CDS.Fields[j] is TDateField then
                              StrHTML.Add('<td style="text-align:center;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TSQLTimeStampField  then
                              StrHTML.Add('<td style="text-align:center;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TFloatField  then
                              StrHTML.Add('<td style="text-align:Right;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TFMTBCDField  then
                              StrHTML.Add('<td style="text-align:Right;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TCurrencyField  then
                              StrHTML.Add('<td style="text-align:Right;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TLargeintField  then
                              StrHTML.Add('<td style="text-align:Right;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TIntegerField  then
                              StrHTML.Add('<td style="text-align:Right;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TBCDField  then
                              StrHTML.Add('<td style="text-align:Right;' + NaoExibir  + '">')
                           else
                              StrHTML.Add('<td style="text-align:left;' + NaoExibir  + '">');

                           ValorStr:=Copy(CDS.Fields[j].AsString, 1, CDS.Fields[j].DisplayWidth) + '</td>';

                           if (CDS.Fields[j] is TBCDField) or
                              (CDS.Fields[j] is TCurrencyField) or
                              (CDS.Fields[j] is TFloatField) or
                              (CDS.Fields[j] is TIntegerField) or
                              (CDS.Fields[j] is TLargeintField) then
                              ValorStr:=FormatCurr(TBCDField(CDS.Fields[j]).DisplayFormat,
                                                   CDS.Fields[j].AsCurrency) + '</td>';

                           if (CDS.Fields[j] is TDateField)  or
                              (CDS.Fields[j] is TSQLTimeStampField)  then
                              ValorStr:=FormatDateTime(TDateTimeField(CDS.Fields[j]).DisplayFormat,
                                                       CDS.Fields[j].AsDateTime) + '</td>';

                           StrHTML.Add(ValorStr);
                        end;
                  end;
               StrHTML.Add('</tr>');

               if z < QTDLinhaPagina then
                  CDS.Next;
               PosicaoFinal:=CDS.RecNo;
               if CDS.Eof or CDS.Bof then
                  Break;
            end;
      end;
   StrHTML.Add('</tbody>');
   StrHTML.Add('</table>');

   //CSS para Tabela
   StrHTML.Add(
      ' <style> ' + //width:98%; margin:0 auto; border:0;
      ' #' + NomeTabela +'{ width:98%; }' +
      //  ' box-shadow: 0 3px 15px darkgrey; border-spacing: 0; } ' +
      ' #' + NomeTabela +' thead th{ font-weight: bold; background-color: #848484; ' +
      '                        color:white; padding:5px 10px; } ' +
      ' #' + NomeTabela +' tr td{ padding:5px 10px; text-align: center;cursor: pointer; } +' +
      ' #' + NomeTabela +' tr td:last-child{text-align: right; } ' +
      //Linhas zebradas ' #TABELACONS tr:nth-child(odd){background-color: #eee; } ' +
      ' #' + NomeTabela +' tr:hover td{background-color: #BDBDBD; } ' +
      ' #' + NomeTabela +' tr.selecionado tr{background-color: white; } '  +
      ' .selecionado {background-color: #045FB4; color: white } '  +
      '' +
      ' </style> '
   );

   //Fun��es JavaScript para tabela
//   CriarJSTabela(NomeTabela);

   StrHTML.Add('</div>');
   Result:=StrHTML.Text;
end;

function TGeradorTableHTML.GerarTableHTMLRedirecionaForm(
                                       NomeTabela : string;
                                       CDS : TClientDataSet;
                                       QTDLinhaPagina : Integer;
                                       Posicao : String) : String;
Var
  StrHTML : TStringList;
  i, z, j, NroLinha, RegAtual, Inc : integer;
  ValorStr, OnClick, NaoExibir : string;
begin
   StrHTML:=TStringList.Create;
   StrHTML.Add(
               '<script type="text/javascript">' +
                 ' var RegSelecionado = 0; ' +
                 'function SelReg(reg) { '        +
                 '  RegSelecionado = reg;' +
                 ' selLinha(); ' +
                 ' };' +
               '</script>'
              );

   StrHTML.Add('<div class="table-responsive">');
   StrHTML.Add('<table style="width: 100%;" id="' + NomeTabela +
                 '" class="table table-hover table-bordered table-condensed">');

   /////////  T�tulos de Colunas ///////////////////////////////////////////////
   StrHTML.Add('<thead>');
   StrHTML.Add('<tr>');
   for i := 0 to CDS.Fields.Count - 1 do
      begin
         if CDS.Fields[i].Tag > 0 then
            begin
               if CDS.Fields[i].Tag > 100 then
                  NaoExibir:='display:none;'
               else
                  NaoExibir:='';
               if CDS.Fields[i] is TDateField then
                  StrHTML.Add('<th style="text-align:center;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TSQLTimeStampField  then
                  StrHTML.Add('<th style="text-align:center;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TFloatField  then
                  StrHTML.Add('<th style="text-align:Right;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TFMTBCDField  then
                  StrHTML.Add('<th style="text-align:Right;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TCurrencyField  then
                  StrHTML.Add('<th style="text-align:Right;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TLargeintField  then
                  StrHTML.Add('<th style="text-align:Right;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TIntegerField  then
                  StrHTML.Add('<th style="text-align:Right;' + NaoExibir + '">')
               else
               if CDS.Fields[i] is TBCDField  then
                  StrHTML.Add('<th style="text-align:Right;' + NaoExibir + '">')
               else
                  StrHTML.Add('<th style="text-align:left;"' + NaoExibir + '">');
               StrHTML.Add(CDS.Fields[i].DisplayLabel + '</th>');
            end;
      end;
   StrHTML.Add('</tr>');
   StrHTML.Add('</thead>');
   /////////////////////////////////////////////////////////////////////////////

   /////////  Conte�do das Colunas /////////////////////////////////////////////
   StrHTML.Add('<tbody>');
   if CDS.Active then
      begin
         TotalRegPaginacao:=CDS.RecordCount;
         SobraPaginacao:=CDS.RecordCount - (CDS.RecordCount Div QTDLinhaPagina) * QTDLinhaPagina;
         if (Posicao = 'INICIO') then
            begin
              CDS.First;
            end
         else

         if (Posicao = 'PROXIMO') then
            begin
               if CDS.RecNo = TotalRegPaginacao then
                  CDS.RecNo:=CDS.RecNo
               else
                  CDS.RecNo:=PosicaoFinal + 1;
            end
         else
         if (Posicao = 'ANTERIOR') then
            begin
               if CDS.RecNo <= QTDLinhaPagina then
                  CDS.RecNo:=1
               else
               if CDS.RecNo = TotalRegPaginacao then
                  CDS.RecNo:=PosicaoFinal - (QTDLinhaPagina + SobraPaginacao - 1)
               else
                  CDS.RecNo:=PosicaoFinal - QTDLinhaPagina - 1;
            end
         else
         if (Posicao = 'FINAL') then
            begin
               CDS.RecNo:=CDS.RecordCount - SobraPaginacao + 1;
            end;

         PosicaoInicial:=CDS.RecNo;
         for z := 1 to QTDLinhaPagina do
            begin
               onClick:='onclick="redirecionaForm(this, false);"';
               StrHTML.Add('<tr style="cursor: pointer;"' + OnClick + '>');
               for j := 0 to CDS.Fields.Count - 1 do
                  begin
                     if CDS.Fields[j].Tag > 0 then
                        begin
                           if CDS.Fields[j].Tag > 100 then
                              NaoExibir:='display:none;'
                           else
                              NaoExibir:='';
                           if CDS.Fields[j] is TDateField then
                              StrHTML.Add('<td style="text-align:center;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TSQLTimeStampField  then
                              StrHTML.Add('<td style="text-align:center;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TFloatField  then
                              StrHTML.Add('<td style="text-align:Right;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TFMTBCDField  then
                              StrHTML.Add('<td style="text-align:Right;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TCurrencyField  then
                              StrHTML.Add('<td style="text-align:Right;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TLargeintField  then
                              StrHTML.Add('<td style="text-align:Right;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TIntegerField  then
                              StrHTML.Add('<td style="text-align:Right;' + NaoExibir  + '">')
                           else
                           if CDS.Fields[j] is TBCDField  then
                              StrHTML.Add('<td style="text-align:Right;' + NaoExibir  + '">')
                           else
                              StrHTML.Add('<td style="text-align:left;' + NaoExibir  + '">');

                           ValorStr:=Copy(CDS.Fields[j].AsString, 1, CDS.Fields[j].DisplayWidth) + '</td>';

                           if (CDS.Fields[j] is TBCDField) or
                              (CDS.Fields[j] is TCurrencyField) or
                              (CDS.Fields[j] is TFloatField) or
                              (CDS.Fields[j] is TIntegerField) or
                              (CDS.Fields[j] is TLargeintField) then
                              ValorStr:=FormatCurr(TBCDField(CDS.Fields[j]).DisplayFormat,
                                                   CDS.Fields[j].AsCurrency) + '</td>';

                           if (CDS.Fields[j] is TDateField)  or
                              (CDS.Fields[j] is TSQLTimeStampField)  then
                              ValorStr:=FormatDateTime(TDateTimeField(CDS.Fields[j]).DisplayFormat,
                                                       CDS.Fields[j].AsDateTime) + '</td>';

                           StrHTML.Add(ValorStr);
                        end;
                  end;
               StrHTML.Add('</tr>');
               if z < QTDLinhaPagina then
                  CDS.Next;
               PosicaoFinal:=CDS.RecNo;
               if CDS.RecNo = TotalRegPaginacao then
                  Break;
            end;
      end;
   StrHTML.Add('</tbody>');
   StrHTML.Add('</table>');

   //CSS para Tabela
   StrHTML.Add(
      ' <style> ' + //width:98%; margin:0 auto; border:0;
      ' #' + NomeTabela +'{ width:98%; }' +
      //  ' box-shadow: 0 3px 15px darkgrey; border-spacing: 0; } ' +
      ' #' + NomeTabela +' thead th{ font-weight: bold; background-color: #848484; ' +
      '                        color:white; padding:5px 10px; } ' +
      ' #' + NomeTabela +' tr td{ padding:5px 10px; text-align: center;cursor: pointer; } +' +
      ' #' + NomeTabela +' tr td:last-child{text-align: right; } ' +
      //Linhas zebradas ' #TABELACONS tr:nth-child(odd){background-color: #eee; } ' +
      ' #' + NomeTabela +' tr:hover td{background-color: #BDBDBD; } ' +
      ' #' + NomeTabela +' tr.selecionado tr{background-color: white; } '  +
      ' .selecionado {background-color: #045FB4; color: white } '  +
      '' +
      ' </style> '
   );

   //Fun��es JavaScript para tabela
   //CriarJSTabela(NomeTabela);

   StrHTML.Add('</div>');
   Result:=StrHTML.Text;
end;

function TGeradorTableHTML.CriarJSTabela(NomeTabela : string) : string;
begin
   Result:=
      ' <script> ' +
      '  ' +
      ' var valorid; '  +
      ' var tabela = document.getElementById("' + NomeTabela + '"); ' +
      ' var linhas = tabela.getElementsByTagName("tr"); ' +
      ' for(var i = 0; i < linhas.length; i++){ ' +
	    '    var linha = linhas[i];  ' +
      '    linha.addEventListener("click", function(){ ' +
      '          selLinha(this, false);	}); ' +
      ' } ' +
      '' +
      ' function redirecionaForm(linha, multiplos){ ' +
	    '    if(!multiplos){ ' +
      '       var linhas = linha.parentElement.getElementsByTagName("tr"); ' +
      '       var linhasel = linhas[0]; ' +
      '       var td = linha.getElementsByTagName("td"); ' +
      '       valorid = td[0].innerHTML; ' +
      '       ajaxCall("RedirecionaForm", "Params=p1=" + valorid + ""); ' +
      '       for(var i = 0; i < linhas.length; i++){ ' +
      '           var linha_ = linhas[i]; ' +
      '           linha_.classList.remove("selecionado"); ' +
      '       } ' +
      '    } ' +
      '    linha.classList.toggle("selecionado"); ' +
      ' } ' +
      ' ' +
      ' function selLinha(linha, multiplos){ ' +
	    '    if(!multiplos){ ' +
      '       var linhas = linha.parentElement.getElementsByTagName("tr"); ' +
      '       var linhasel = linhas[0]; ' +
      '       var td = linha.getElementsByTagName("td"); ' +
      '       valorid = td[0].innerHTML; ' +
      '       ajaxCall("PegarID", "Params=p1=" + valorid + ""); ' +
      '       for(var i = 0; i < linhas.length; i++){ ' +
      '           var linha_ = linhas[i]; ' +
      '           linha_.classList.remove("selecionado"); ' +
      '       } ' +
      '    } ' +
      '    linha.classList.toggle("selecionado"); ' +
      ' } ' +
      ' ' +
      '' +
      ' </script> ' ;
end;

end.
