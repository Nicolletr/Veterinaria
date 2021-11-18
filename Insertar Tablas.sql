
/*==============================================================*/
/* Table: CITA                                                  */
/*==============================================================*/
create table CITA (
   ID_CITA              INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   FECHA_PROGRAMADA     DATE                 null,
   constraint PK_CITA primary key (ID_CITA)
);
/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
	C_I_                 VARCHAR(20)          null,	
   NOMBRE               VARCHAR(20)          null,
   APELLIDO             VARCHAR(20)          null,
   GENERO               VARCHAR(20)          null,
   DIRECCION            VARCHAR(60)          null,
   TELEFONO             VARCHAR(15)          null,
   FECHA_REGISTRO       DATE                 null,
   ANTIGUEDAD           VARCHAR(15)          null,
   ULTIMA_VISITA        DATE                 null,
   NUMERO_MASCOTAS      NUMERIC              null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: COMPRA                                                */
/*==============================================================*/
create table COMPRA (
   ID_COMPRA            INT4                 not null,
   ID_VETERINARIA       INT4                 not null,
   ID_PRODUCTO          INT4                 not null,
   ID_PROVEEDOR         INT4                 null,
   ID_COMPRA_DETALLE    INT4                 not null,
   FECHA_COMPRA         DATE                 null,
   constraint PK_COMPRA primary key (ID_COMPRA)
);
/*==============================================================*/
/* Table: COMPRA_DETALLE                                        */
/*==============================================================*/
create table COMPRA_DETALLE (
   ID_COMPRA_DETALLE    INT4                 not null,
   DETALLE_PRODUCTO     VARCHAR(30)          null,
   VALOR_UNITARIO       MONEY                null,
   CANTIDAD_PRODUCTO    MONEY                null,
   SUBTOTAL             MONEY                null,
   IVA                  MONEY                null,
   TOTAL                MONEY                null,
   constraint PK_COMPRA_DETALLE primary key (ID_COMPRA_DETALLE)
);


/*==============================================================*/
/* Table: HABITO_MASCOTA                                        */
/*==============================================================*/
create table HABITO_MASCOTA (
   ID_HABITO            INT4                 not null,
   DESCRIPCION          VARCHAR(60)          null,
   constraint PK_HABITO_MASCOTA primary key (ID_HABITO)
);

/*==============================================================*/
/* Table: MASCOTA                                               */
/*==============================================================*/
create table MASCOTA (
   ID_MASCOTA           INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_TIPO_MASCOTA      INT4                 not null,
   ID_HABITO            INT4                 null,
   NOMBRE_MASCOTA       VARCHAR(20)          null,
   FECHA_NACIMIENTO     DATE                 null,
   GENERO_MACOTA        VARCHAR(15)          null,
   COLOR                VARCHAR(15)          null,
   ESTERILIZACION       BOOL                 null,
   constraint PK_MASCOTA primary key (ID_MASCOTA)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          INT4                 not null,
   ID_TIPO_PRODUCTO     INT4                 not null,
   NOMBRE_PRODUCTO      VARCHAR(20)          null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR (
   ID_PROVEEDOR         INT4                 not null,
   RUC                  VARCHAR(20)          null,
   NOMBRE_PROVEEDOR     VARCHAR(20)          null,
   APELLIDO_PROVEEDOR   VARCHAR(20)          null,
   constraint PK_PROVEEDOR primary key (ID_PROVEEDOR)
);

/*==============================================================*/
/* Table: TIPO_MASCOTA                                          */
/*==============================================================*/
create table TIPO_MASCOTA (
   ID_TIPO_MASCOTA      INT4                 not null,
   DESCRIPCION_TM       VARCHAR(30)          null,
   constraint PK_TIPO_MASCOTA primary key (ID_TIPO_MASCOTA)
);

/*==============================================================*/
/* Table: TIPO_PRODUCTO                                         */
/*==============================================================*/
create table TIPO_PRODUCTO (
   ID_TIPO_PRODUCTO     INT4                 not null,
   NOMBRE_TP            VARCHAR(20)          null,
   DETALLE_TP           VARCHAR(20)          null,
   constraint PK_TIPO_PRODUCTO primary key (ID_TIPO_PRODUCTO)
);

/*==============================================================*/
/* Table: VACUNA                                                */
/*==============================================================*/
create table VACUNA (
   ID_VACUNA            INT4                 not null,
   ID_MASCOTA           INT4                 not null,
   ID_VETERINARIO       INT4                 not null,
   ID_PRODUCTO          INT4                 not null,
   FECHA_APLICACION     DATE                 null,
   DOSIS                NUMERIC              null,
   constraint PK_VACUNA primary key (ID_VACUNA)
);

/*==============================================================*/
/* Table: VENTA                                                 */
/*==============================================================*/
create table VENTA (
   ID_VENTA             INT4                 not null,
   ID_VETERINARIA       INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_PRODUCTO          INT4                 not null,
   ID_VENTA_DETALLE     INT4                 not null,
   FECHA_VENTA          DATE                 null,
   PRESCRIPCION         BOOL                 null,
   constraint PK_VENTA primary key (ID_VENTA)
);


/*==============================================================*/
/* Table: VENTA_DETALLE                                         */
/*==============================================================*/
create table VENTA_DETALLE (
   ID_VENTA_DETALLE     INT4                 not null,
   DETALLE_PRODUCTO     VARCHAR(30)          null,
   VALOR_UNITARIO       MONEY                null,
   CANTIDAD_VENTA       NUMERIC              null,	
   SUBTOTAL             MONEY                null,
   IVA                  MONEY                null,
   TOTAL                MONEY                null,
   constraint PK_VENTA_DETALLE primary key (ID_VENTA_DETALLE)
);


/*==============================================================*/
/* Table: VETERINARIA                                           */
/*==============================================================*/
create table VETERINARIA (
   ID_VETERINARIA       INT4                 not null,
   NOMBRE_VETERINARIA   VARCHAR(20)          null,
   DIRECCION            VARCHAR(60)          null,
   constraint PK_VETERINARIA primary key (ID_VETERINARIA)
);

/*==============================================================*/
/* Table: VETERINARIO                                           */
/*==============================================================*/
create table VETERINARIO (
   ID_VETERINARIO       INT4                 not null,
   ID_VETERINARIA       INT4                 not null,
   NOMBRE_VETERINARIO   VARCHAR(20)          null,
   APELLIDO_VETERINARIO VARCHAR(20)          null,
   constraint PK_VETERINARIO primary key (ID_VETERINARIO)
);


alter table CITA
   add constraint FK_CITA_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table COMPRA
   add constraint FK_COMPRA_RELATIONS_VETERINA foreign key (ID_VETERINARIA)
      references VETERINARIA (ID_VETERINARIA)
      on delete restrict on update restrict;

alter table COMPRA
   add constraint FK_COMPRA_RELATIONS_COMPRA_D foreign key (ID_COMPRA_DETALLE)
      references COMPRA_DETALLE (ID_COMPRA_DETALLE)
      on delete restrict on update restrict;

alter table COMPRA
   add constraint FK_COMPRA_RELATIONS_PROVEEDO foreign key (ID_PROVEEDOR)
      references PROVEEDOR (ID_PROVEEDOR)
      on delete restrict on update restrict;  

alter table COMPRA
   add constraint FK_COMPRA_RELATIONS_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
      on delete restrict on update restrict;

alter table MASCOTA
   add constraint FK_MASCOTA_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table MASCOTA
   add constraint FK_MASCOTA_RELATIONS_TIPO_MAS foreign key (ID_TIPO_MASCOTA)
      references TIPO_MASCOTA (ID_TIPO_MASCOTA)
      on delete restrict on update restrict;

alter table MASCOTA
   add constraint FK_MASCOTA_RELATIONS_HABITO_M foreign key (ID_HABITO)
      references HABITO_MASCOTA (ID_HABITO)
      on delete restrict on update restrict;  

alter table PRODUCTO
   add constraint FK_PRODUCTO_RELATIONS_TIPO_PRO foreign key (ID_TIPO_PRODUCTO)
      references TIPO_PRODUCTO (ID_TIPO_PRODUCTO)
      on delete restrict on update restrict;

alter table VACUNA
   add constraint FK_VACUNA_RELATIONS_MASCOTA foreign key (ID_MASCOTA)
      references MASCOTA (ID_MASCOTA)
      on delete restrict on update restrict;

alter table VACUNA
   add constraint FK_VACUNA_RELATIONS_VETERINA foreign key (ID_VETERINARIO)
      references VETERINARIO (ID_VETERINARIO)
      on delete restrict on update restrict;

alter table VACUNA
   add constraint FK_VACUNA_RELATIONS_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
      on delete restrict on update restrict;

alter table VENTA
   add constraint FK_VENTA_RELATIONS_VETERINA foreign key (ID_VETERINARIA)
      references VETERINARIA (ID_VETERINARIA)
      on delete restrict on update restrict;

alter table VENTA
   add constraint FK_VENTA_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table VENTA
   add constraint FK_VENTA_RELATIONS_VENTA_DE foreign key (ID_VENTA_DETALLE)
      references VENTA_DETALLE (ID_VENTA_DETALLE)
      on delete restrict on update restrict;

alter table VENTA
   add constraint FK_VENTA_RELATIONS_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
      on delete restrict on update restrict;

alter table VETERINARIO
   add constraint FK_VETERINA_RELATIONS_VETERINA foreign key (ID_VETERINARIA)
      references VETERINARIA (ID_VETERINARIA)
      on delete restrict on update restrict;