data autos_sem_comprimir; 

  set sashelp.cars; 

run; 

 

data  autos_comprimido(compress=yes reuse=yes); 

Set sashelp.cars; 

run; 

 

/*-----------------------------------------------------------------------------------------------*/ 

/* Passo 2: Mostre o tamanho das 2 tabelas tempor�rias.   		*/ 

/* Poder�amos usar proc content, mas pode ser interessante ver essas informa��es 		*/ 

/* na  tabela sashelp.vtable						 */ 

/*-----------------------------------------------------------------------------------------------*/ 

 

proc print data=sashelp.vtable noobs; 

var libname memname filesize; 

Where libname = 'WORK' 

and memname contains 'AUTOS'; 

format filesize sizekmg.; 

title1 Tamanho das 2 tabelas, uma comprimida e  outra sem compress�o; 

title2 (� recomendav�l  ver o log para ver a porcentagem de compress�o); 

 

run; 

 

title; 