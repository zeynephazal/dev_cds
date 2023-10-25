@AbapCatalog.sqlViewName: 'ZZCENGIZ_CDS_V01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds eğitim dev'
define view ZCDS_DEV 
//as select from data_source_name
        as select from ekko 
        inner join ekpo on ekko.ebeln = ekpo.ebeln
        inner join lfa1 on lfa1.lifnr = ekko.lifnr
        inner join mara on mara.matnr = ekpo.matnr
        left outer join makt on makt.matnr = mara.matnr and
                                makt.spras = $session.system_language
    {     
   key ekpo.ebeln,
   key ekpo.ebelp,
    ekpo.matnr,
    makt.maktx,
    ekpo.werks,
    ekpo.lgort,
    ekpo.meins, 
    lfa1.lifnr,
    lfa1.name1 as adr,
   concat_with_space( lfa1.stras , lfa1.mcod3 , 1 ) as address
}
