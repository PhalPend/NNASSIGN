/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* This class contains all the Utility Methods used for Country Layer API.
* This class is invoked from CountryCalloutSch schedulabale interface which runs every day
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Phalguni Pendyala
* @modifiedBy     
* @maintainedBy   
* @version        1.0
**/

public class CountryApiUtil {
    
    /**
* ───────────────────────────────────────────────────────────────────────────────────────────────┐
* * @author         Phalguni Pendyala
* * @modifiedBy 
* This Future Method is used for callout to Country Layer api from schedulable interface
* Endpoint and Authentication details are fecthed from Integration Settings Custom Metadata
* This Method also used HttpCalloutWrapper generic framework to perfom callout 
* ───────────────────────────────────────────────────────────────────────────────────────────────┘
*/
    
    @future (callout=true)
    public static void getCountryDetails(){
        Integration_Settings__mdt  countryMapping = new Integration_Settings__mdt ();
        countryMapping = [Select DeveloperName,API_Key__c,
                          EndPoint__c,HttpMethod__c from
                          Integration_Settings__mdt where
                          DeveloperName = 'All_Countries_Data'];
        string EndPoint ='';
        HTTPResponse res;
        Map<string,country__c> cMap = getExistingCountryDetails();
        if(!Test.isRunningTest()){
            EndPoint = countryMapping.EndPoint__c+EncodingUtil.urlEncode(countryMapping.API_Key__c,'utf-8'); 
            res=  HttpCalloutWrapper.callout(countryMapping.HttpMethod__c,EndPoint,'');
            
        }
        Map<string,CountryLayerAPIWrapper> cLMap = parseResponse(res);
        comAndUpdate(cLMap,cMap);
    }
    
    /**
* ───────────────────────────────────────────────────────────────────────────────────────────────┐
* * @author         Phalguni Pendyala
* * @modifiedBy 
* This Method is used existing Country Data information from Salesforce 
* Further this data is used to compare any data changes from the API 
* ───────────────────────────────────────────────────────────────────────────────────────────────┘
*/
    
    public static Map<string,country__c> getExistingCountryDetails(){
        Map<string,country__c> cMap = new Map<string,country__c> ();
        for (country__c cnt:[select id,name,Country_Name__c,Capital_city__c,
                             alpha2code__c,alpha3code__c,Region__c,
                             RegionalBlocs__c from country__c] )
        {
            cMap.put(cnt.Country_Name__c,cnt);
        }      
        return cMap;   
    }
    
    /**
* ───────────────────────────────────────────────────────────────────────────────────────────────┐
* * @author         Phalguni Pendyala
* * @modifiedBy 
* This Method is used PARE Country Data information from Country Layer API 
* Further this data is used to compare any data changes from the Salesforce Country Data  
* ───────────────────────────────────────────────────────────────────────────────────────────────┘
*/
    public static Map<string,CountryLayerAPIWrapper> parseResponse (HTTPResponse res){
        Map<string,CountryLayerAPIWrapper> cLMap = new Map<string,CountryLayerAPIWrapper> ();
        list<CountryLayerAPIWrapper> cntList = new list<CountryLayerAPIWrapper>();
        if(!Test.isRunningTest()){
            cntList = (List<CountryLayerAPIWrapper>)JSON.deserialize(res.getBody(), list<CountryLayerAPIWrapper>.class);
        }
        
        for(CountryLayerAPIWrapper cn:cntList){
            cLMap.put(cn.name,cn);
        }
        return cLMap;
    }
    
    /**
* ───────────────────────────────────────────────────────────────────────────────────────────────┐
* * @author         Phalguni Pendyala
* * @modifiedBy 
* This Method is used Compare and Upsert the Country Data 
* This Method used Country_Name__c as an External Id to perform Upsert 
* If country data is found in salesforce it will check for any changes from API for update  else 
* it will create new Country Data entry in salesforce
* ───────────────────────────────────────────────────────────────────────────────────────────────┘
*/
    
    public static void comAndUpdate (Map<string,CountryLayerAPIWrapper> cLMap ,Map<string,country__c> cMap){
        list<country__c> clistToUpdate = new list<country__c> ();
        for(string str:cLMap.keySet()){
            
            if(cMap.keyset().contains(str)) {
                country__c cntry = new country__c (Country_Name__c = str);
                
                
                if(cLMap.get(str).capital != cMap.get(str).Capital_city__c ) {
                    cntry.Capital_city__c=cLMap.get(str).capital;
                }
                if(cLMap.get(str).alpha2Code != cMap.get(str).alpha2code__c ) {
                    cntry.alpha2code__c =cLMap.get(str).alpha2Code;
                }
                if(cLMap.get(str).alpha3Code != cMap.get(str).alpha3code__c ) {
                    cntry.alpha3code__c =cLMap.get(str).alpha3Code;
                }
                if(cLMap.get(str).region != cMap.get(str).region__c ) {
                    cntry.region__c =cLMap.get(str).region;
                }
                if(null<>cLMap.get(str).regionalBlocs && cLMap.get(str).regionalBlocs[0].acronym != cMap.get(str).RegionalBlocs__c ) {
                    cntry.RegionalBlocs__c =cLMap.get(str).regionalBlocs[0].acronym;
                }
                clistToUpdate.add(cntry);
                
            }else{
                country__c cntry = new country__c ();
                cntry.Country_Name__c =cLMap.get(str).name;
                cntry.Capital_city__c=cLMap.get(str).capital;
                cntry.alpha2code__c =cLMap.get(str).alpha2Code;
                cntry.alpha3code__c =cLMap.get(str).alpha3Code;
                cntry.region__c =cLMap.get(str).region;
                clistToUpdate.add(cntry);
                
            }
            
        }
        if(clistToUpdate.size()>0) {
            Try{
                upsert clistToUpdate;
            }catch (exception e){
                Error_Handler__b error = new Error_Handler__b();
                error.Class_Name__c  = e.getStackTraceString();
                error.Line__c    =e.getLineNumber();
                error.Exception_Mesage__c  =e.getMessage ();
                if(!test.isRunningTest()){
                    insert error;
                }
                
            }
            
        }
    }
}