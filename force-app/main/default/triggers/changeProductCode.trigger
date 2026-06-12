trigger changeProductCode on Product2 (before insert) {
    for(Product2 lst : trigger.new){
        if(lst.productCode != null && lst.ProductCode!=''){
            LST.ProductCode='XYZ-'+LST.ProductCode;
        }
    }
}