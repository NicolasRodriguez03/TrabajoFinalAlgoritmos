unit listados_ordenados;

interface
    definicion_datos;
    lista_terreno;
    arboles;
    manejo_Arboles;


PROCEDURE GENERAR_LISTA_ZONA(VAR L:T_LISTA; VAR ARCH_T:ARCHIVO_T);
PROCEDURE LISTADO_AYN_CON_AVALUO(VAR ARBOL:T_PUNT; L:T_LISTA);
PROCEDURE LISTADO_FECHA();
PROCEDURE LISTADO_ZONA();
PROCEDURE GENERAR_LISTA_FECHA(VAR L: T_LISTA; VAR ARCH_T:ARCHIVO_T);

implementation
    PROCEDURE GENERAR_LISTA_ZONA(VAR L:T_LISTA; VAR ARCH_T:ARCHIVO_T);
    VAR 
        I:CARDINAL;
    begin
    CREARLISTA(L);
      For I:=0 TO (FILESIZE(ARCH_T)-1) DO
      begin
      LEER_DATO_T(ARCH_T; I, DATO);
      AGREGAR_ZONA(L_ZONA; DATO);
      END;
      
    PROCEDURE GENERAR_LISTA_FECHA(VAR L: T_LISTA; VAR ARCH_T:ARCHIVO_T);
    VAR 
        I:CARDINAL;
    begin
    CREARLISTA(L);
      For I:=0 TO (FILESIZE(ARCH_T)-1) DO
      begin
      LEER_DATO_T(ARCH_T; I, DATO);
      AGREGAR_FECHA(L_FECHA; DATO);
  
      END;
    end;
    
    PROCEDURE LISTADO_FECHA(ARCH_T:ARCHIVO_T);
    VAR X:STRING[4]; J:INTEGER;
    L:T_LISTA;
    begin
    J:=2;
    GENERAR_LISTA_FECHA( L; ARCH_T);
      WRITE('Ingrese año');
      Readln (x);
          PRIMERO(L);
        WHILE NOT FIN(L) DO
        BEGIN
            RECUPERAR(L,E);
                if COPY(E.F_INC,7,4)=x
                begin
                MUESTRA_DATOS(E);
                GOTOXY(1,J);
                    WRITE(E.F_INC);
                GOTOXY(30,J);
                    WRITE(E.N_CONT);
                GOTOXY(60,J);
                    WRITE(E.DOMICILIO);
                GOTOXY(90,J);
                    WRITE('$', E.AVALUO);
                SIGUIENTE(L);
                J:= J+1;
                end;
        END;
 
    end;

    PROCEDURE LISTADO_ZONA(ARCH_T:ARCHIVO_T);
    VAR
    E:T_DATO_T;J:INTEGER;
    BEGIN
    J:=2;
    GENERAR_LISTA_ZONA(L; ARCH_T);
        PRIMERO(L);
        WHILE NOT FIN(L) DO
        BEGIN
            RECUPERAR(L,E);
            GOTOXY(1,J);
                WRITE(E.ZONA);
            GOTOXY(15,J);
                WRITE(E.N_CONT);
            GOTOXY(35,J);
               WRITE(E.N_MENS);
            GOTOXY(70,J);
                WRITE(E.DOMICILIO);
            GOTOXY(100,J);
                WRITE('$', E.AVALUO);
            SIGUIENTE(L);
            J:= J+1;
        END;
    END;

    PROCEDURE listado_ordenado_ayn(VAR ARCH_C:ARCHIVO_C; ARCH_T:ARCHIVO_T; VAR ARBOL:T_PUNT; J:CARDINAL);
    var I,J:CARDINAL; x:string[8]; dato:T_DATO_T;
    BEGIN
    IF ARBOL <> NIL THEN BEGIN
        listado_ordenado_ayn(ARCH_C, ARCH_T, ARBOL^.H_I, J);
        x:=OBTENER_N_CONT (ARCH_C, ARBOL^.INFO.POS_ARCH);
        FOR I:= 0 TO (FILESIZE(ARCH_T)-1) DO
        begin
          LEER_DATO_T(ARCH_T, I, DATO);
          IF DATO.N_CONT=X THEN
          BEGIN
            J:=J+1;
            GOTOXY(1,J); 
            WRITE(ARBOL^.INFO.CLAVE);
             gotoxy(30,J);
            WRITE(DATO.N_CONT);
             gotoxy(60,J);
            WRITE(DATO.DOMICILIO);
             gotoxy(90,J);
            WRITE('$ ', DATO.AVALUO);
          END;
        end;
        listado_ordenado_ayn(ARCH_C, ARCH_T, ARBOL^.H_D, J);
    end;

    PROCEDURE FILA_P_AYN ();
    BEGIN
     gotoxy(1,1);
    write ('NOMBYAP');
    gotoxy(30,1);
    write ('N CONT');
    gotoxy(60,1);
    write ('DIRECCION');
    gotoxy(90,1);
    write ('VALOR');  
    END;
     
    PROCEDURE FILA_P_ZONA ();
    BEGIN
     gotoxy(1,1);
    write ('ZONA');
    gotoxy(1,1);
    write ('N CONT');
    gotoxy(35,1);
    write ('N. PLANO DE MENSURA');
    gotoxy(70,1);
    write ('DIRECCION');
    gotoxy(100,1);
    write ('VALOR');  
    END;
    
    
    PROCEDURE FILA_P_FECHA();
    BEGIN
     gotoxy(1,1);
    write ('FECHA INSC.');
    gotoxy(30,1);
    write ('N. CONT');
    gotoxy(60,1);
    write ('DOMICILIO');
    gotoxy(90,1);
    write ('VALOR');  
    END;

    PROCEDURE comprobante(ARBOL:t_punt, var arch_c:ARCHIVO_C, var arch_t:archivo_t);
    VAR DATO:DATOS_CONT; X:T_DATO_T;
    begin
    BUSCAR(ARBOL_AYN, ARBOL_DNI, POS);
    LEER_DATO_C(ARCH_C,POS, DATO);
    WITH (DATO) DO
    GOTOXY(1,1);
    Write ('N. CONT: ',N_CONT );
    GOTOXY(40,1);
    Write ('NYA: ', CONCAT(NOMBRE,APELLIDO));
    GOTOXY(1,2);
    WRITE ('Direccion: ', DIREC);
    GOTOXY(40,2);
    WRITE ('Ciudad: ',ciudad);
    GOTOXY(1,3);
    WRITE ('DNI: ', DNI);
    GOTOXY(40,3);
    WRITE ('Nacimiento: ', F_NAC);
    GOTOXY(75,3);
    WRITE ('Telefono: ', TEL);
    GOTOXY(1,4);
    WRITE ('Mail: ', MAIL);     
    GOTOXY(75,4);
    WRITE ('ESTADO: ');
    IF ESTADO=FALSE THEN;
    begin
         Write ('INACTIVO');
    else
        begin
            Write ('ACTIVO');
            Writeln('');
            Writeln('Seccion de propiedades');
            J:=8
            For I:=0 to (FILESIZE(ARCH_T)-1);
            BEGIN
                LEER_DATO_T(ARCH_T, I, X);
                IF DATO.N_CONT=X.N_CONT THEN
                begin
                  GOTOXY(40,J);
                  Write('N. plano mens.: ');
                  GOTOXY(1,J+1);
                  Write('Valor: ');
                  GOTOXY(1,J+2);
                  Write('ZONA: '):
                  GOTOXY(20,J+2);
                  Write('Tipo Edif.: ');
                  GOTOXY(40,J+1);
                  Write('Fecha insc.: ');
                  GOTOXY(1,J);
                  Write('Domicilio: ');
                  GOTOXY(40,J+2);
                  Write('Superficie: ');
                  J:=J+4;
                end;
            end;
        end;
        
end.