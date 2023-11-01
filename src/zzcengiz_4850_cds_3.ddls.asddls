@AbapCatalog.sqlViewName: 'ZZCENGIZ_CDS_V03'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Eğitim-2.1'

define view    ZZCENGIZ_4850_CDS_3 
as select from ZZCENGIZ_4850_CDS_2  as kaynak_cds
inner join vbrk on vbrk.vbeln = kaynak_cds.vbeln 

{
   kaynak_cds.vbeln,
   sum(kaynak_cds.conversion_netwr)  as toplam_net_deger,
   kaynak_cds.kunnrAd                as musteri_ad_soyad,
   count(*)                          as toplam_Fatura_Adedi,
//ortalama_miktar ?  
  division( cast(sum(kaynak_cds.conversion_netwr) as abap.curr( 10, 2 )) , cast(count(*) as abap.int1) , 2) as ortalama_miktar,
   substring(kaynak_cds.fkdat,1,4)   as faturalama_yili,
   substring(kaynak_cds.fkdat,5,2)   as faturalama_ay,
   substring(kaynak_cds.fkdat,7,2)   as faturalama_gunu,
   substring(vbrk.inco2_l,1,3)       as incoterm_yeri
   
}

group by kaynak_cds.vbeln,
         kaynak_cds.kunnrAd,
         kaynak_cds.fkdat,
         vbrk.inco2_l
