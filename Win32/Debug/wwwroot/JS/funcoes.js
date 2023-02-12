function FormataData(input)
{
        if (input.value.length==10)
	{
           event.keyCode=0;
	}

        var tecla = event.keyCode;
        if (tecla > 47 && tecla < 58){

           input.value=input.value;
        }
        else
        {
           event.keyCode=0;
        }



        if ((input.value.length==2)||(input.value.length==5))
	{
	   input.value=input.value + "/" ;
	}
}

function SomenteNumero(e){
    var tecla=(window.event)?event.keyCode:e.which;
    if((tecla>47 && tecla<58)) return true;
    else{
    	if (tecla==8 || tecla==0) return true;
	else  return false;
    }
}


function Formatar(src, mask)
{
   var tamMask = mask.length;
   var tamSrc = src.value.length;

   var saida = mask.substring(0,1);
   var texto = mask.substring(tamSrc)
   if (texto.substring(0,1) != saida)
   {
      if (tamSrc <= tamMask) {
         src.value += texto.substring(0,1);
      }
      else
      {
         src.value=src.value.substring(0, src.value.length - 1);
      }
   }
}

function FormatarDisplay(src, mask)
{
   var tamMask = mask.length;
   var tamSrc = src.value.length;

   var saida = mask.substring(0,1);
   var texto = mask.substring(tamSrc)
   if (texto.substring(0,1) != saida)
   {
         src.value += texto.substring(0,1);

   }
}


function FormatarCnpj(src, mask)
{
   if (src.value.length==18)
	{
           event.keyCode=0;
	}

   var tecla = event.keyCode;
   if (tecla > 47 && tecla < 58){

      src.value=src.value;
   }
   else
   {
      event.keyCode=0;
   }


   var i = src.value.length;
   var saida = mask.substring(0,1);
   var texto = mask.substring(i)
   if (texto.substring(0,1) != saida)
   {
      src.value += texto.substring(0,1);
   }
}

function CaixaAlta(Valor)
{
    Valor.value=Valor.value.toUpperCase();
}



