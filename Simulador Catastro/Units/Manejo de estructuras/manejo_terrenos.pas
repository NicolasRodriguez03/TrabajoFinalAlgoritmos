unit manejo_terrenos;

interface
uses
    definicion_datos, crt, lista, manejo_archivo_terr, MANEJO_ARCHIVO_CONT;
    PROCEDURE ALTA_T (VAR ARCH_T: ARCHIVO_T; x1:string);
    PROCEDURE MODIF_DATO_T(VAR ARCH_T: ARCHIVO_T; POS:longint; VAR DATO:T_DATO_T);
    procedure MODIFICACION_T(VAR ARCH_T:ARCHIVO_T; POS:longint);
    PROCEDURE CONSULTA_T(VAR ARCH_T:ARCHIVO_T; POS:longint);
    procedure BAJA_CONT_TER (VAR ARCH_T:ARCHIVO_T; X:STRING);
    procedure BAJA_TERRENO (VAR ARCH_T:ARCHIVO_T; POS:longint);

implementation
    PROCEDURE ALTA_T (VAR ARCH_T: ARCHIVO_T; x1:string);
    VAR X:T_DATO_T;
        n_cont:string;
    BEGIN
         Writeln ('Ingrese numero de contribuyente');
            Readln(N_CONT);
        if busqueda_archivo_n_cont(arch_c,n_cont) <> -1 then
            begin
            CARGAR_T(X, n_cont, x1);
            AVALUAR(X);
            GUARDAR_DATO_T(ARCH_T,FILESIZE(arch_t),X);
            end
        else
            begin
            ClrScr;
            WriteLn(Utf8ToAnsi('No existe ese contribuyente, por favor realice alta a través del menú de contribuyentes'));
            Writeln('Presione cualquier tecla para continuar');
            readkey;
            end;

    END;


    PROCEDURE MODIF_DATO_T(VAR ARCH_T: ARCHIVO_T; POS:longint; VAR DATO:T_DATO_T);   //esto esta bien, no tocar
        VAR
            OP:BYTE; OP_2:STRING[2];
            AUX:string[50];
            AUX_2: BYTE;
            AUX_3: REAL;
        begin
        LEER_DATO_T(ARCH_T, POS, DATO);
        Writeln ('Que dato desea modificar? (Ingrese nro. de dato o ingrese cualquier otra tecla para volver al menu)');
        Readln (OP);
        CASE (OP) OF

            1: BEGIN
                Writeln ('Desea modificar nro. de contribuyente? (SI/NO)');
                Readln (OP_2);
                IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                    BEGIN
                    Writeln ('Ingrese nuevo dato');
                    Readln (AUX);
                    DATO.N_CONT:= AUX;
                    END
                ELSE
                    MODIF_DATO_T(ARCH_T, POS, DATO);
                END;
            2: BEGIN
                Writeln ('Desea modificar numero plano de mensura? (SI/NO)');
                Readln (OP_2);
                IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                    BEGIN
                    Writeln ('Ingrese nuevo dato');
                    Readln (AUX);
                    dato.N_MENS:= AUX;
                    END
                ELSE
                    MODIF_DATO_T (ARCH_t, POS, dato);
                END;
            3:BEGIN
                Writeln ('Desea modificar fecha de inscripcion? (SI/NO)');
                Readln (OP_2);
                IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                BEGIN
                    Writeln ('Ingrese nuevo dato');
                    Readln (AUX);
                    dato.f_inc:= AUX;
                    END
                ELSE
                    MODIF_DATO_T (ARCH_t, POS, dato);
                END;

            4: BEGIN
                Writeln ('Desea modificar dirección? (SI/NO)');
                Readln (OP_2);
                IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                    BEGIN
                    Writeln ('Ingrese nuevo dato');
                    Readln (AUX);
                    dato.domicilio:= AUX;
                    END
                ELSE
                    MODIF_DATO_T (ARCH_t, POS, dato);
                END;
            5: BEGIN
                Writeln ('Desea modificar zona? (SI/NO)');
                Readln (OP_2);
                IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                    BEGIN
                    Writeln ('Ingrese nuevo dato');
                    Readln (AUX_2);
                    dato.zona:= AUX_2;
                    AVALUAR(DATO);
                    END
                ELSE
                    MODIF_DATO_T (ARCH_t, POS, dato);
                END;
            6:BEGIN
              Writeln ('Desea modificar tipo edificacion? (SI/NO)');
                Readln (OP_2);
                IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                    BEGIN
                    Writeln ('Ingrese nuevo dato');
                    Readln (AUX_2);
                    dato.tipo_e:= AUX_2;
                    AVALUAR(DATO);
                    END
                ELSE
                    MODIF_DATO_T (ARCH_T, POS, DATO);
                END;
            7: BEGIN
                Writeln ('NO PUEDE MODIFICAR AVALUO');
                MODIF_DATO_T (ARCH_t, POS, DATO);
               END;
            8:BEGIN
              Writeln ('Desea modificar SUPERFICIE? (SI/NO)');
                Readln (OP_2);
                IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                    BEGIN
                    Writeln ('Ingrese nuevo dato');
                    Readln (AUX_3);
                    DATO.SUPERFICIE:= AUX_3;
                    AVALUAR(DATO);
                    END
                ELSE
                    MODIF_DATO_T(ARCH_T, POS, DATO);
                    END;
            END;
        end;

    procedure MODIFICACION_T(VAR ARCH_T:ARCHIVO_T; POS:longint);
    VAR DATO:T_DATO_T;
    begin
      MOSTRAR_DATOS_T(ARCH_T, POS);
      Writeln();
      MODIF_DATO_t(ARCH_T, POS, DATO);
      GUARDAR_DATO_T(ARCH_T, POS, DATO);
    end;


    PROCEDURE CONSULTA_T(VAR ARCH_T:ARCHIVO_T; POS:longint);
    VAR X:STRING;
    BEGIN
        WRITELN ('INGRESE NUMERO DE PLANO DE MENSURA PARA REALIZAR CONSULTA:');
        READLN (X);
        busqueda_archivo_mens (ARCH_T, x, pos);
        MOSTRAR_DATOS_T(ARCH_T, POS);
    END;

    procedure BAJA_CONT_TER (VAR ARCH_T:ARCHIVO_T; X:STRING); //ELIMINA TODOS LOS N_CONT QUE LE PERTENEZCAN 
    Var I:longint; TEMP: T_DATO_T;
    BEGIN
        FOR I:=0 TO (FILESIZE(ARCH_T)-1) DO
        begin
            LEER_DATO_T(ARCH_T,I,TEMP);
            IF TEMP.N_CONT=X THEN
            BEGIN
                TEMP.N_CONT:=('-');
                GUARDAR_DATO_T(arch_t, I, TEMP)
            END;
        end;
    end;


    procedure BAJA_TERRENO (VAR ARCH_T:ARCHIVO_T; POS:longint); //modificar eliminando
    Var REG:T_DATO_T;
        OP, aux:string;        // VER SI PODEMOS CAMBIAR A STRING
    BEGIN
        MOSTRAR_DATOS_T(ARCH_T, POS);
        Writeln ('Desea dar de baja a este terreno? (SI/NO)');
        readln(aux); // auxiliar que evita el bug de que tpascal saltea el read de strings a veces
        Readln (OP);
        IF (OP='Si') or (OP='SI') or (OP='si') then
        BEGIN
            LEER_DATO_T(ARCH_T, POS, REG);
            FILLCHAR(REG,SIZEOF(REG),#0);
            GUARDAR_DATO_T(ARCH_T, POS, REG);
            Borrar_elemento(ARCH_T,POS);
            WRITELN('La baja del terreno ', REG.N_MENS, ' ha sido exitosa, presione cualquier tecla para volver al menu principal');
            readkey;
        END;
    end;
END.
