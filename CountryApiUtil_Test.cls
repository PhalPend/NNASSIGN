/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* This class contains test Methods for Utility Methods used in CountryApiUtil.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Phalguni Pendyala
* @modifiedBy     
* @maintainedBy   
* @version        1.0
**/

@isTest
public class CountryApiUtil_Test {
    @testSetup 
    static void createData(){
        country__c con = TestDataFactory.createCountry('India','ASIA','IN','IND');
    }
    
    @isTest static void testDeserialize(){     
        Test.setMock(HttpCalloutMock.class, new MockCountryLayerAPIHttpResponse());
        Test.startTest();
        HTTPResponse res=  HttpCalloutWrapper.callout('GET','https://www.example.com/example','');
        system.assertEquals(200, res.getStatusCode());
        test.stopTest();
        
    }
    
    @isTest static void getCountryDetailsTest(){     
        Map<string,country__c> cMap = new Map<string,country__c>();
       for(country__c cnt: [select id,name,Country_Name__c,Capital_city__c,
                                 alpha2code__c,alpha3code__c,Region__c,
                                 RegionalBlocs__c from country__c])
       {
            cMap.put(cnt.Country_Name__c,cnt);
       }
       test.startTest();
        CountryApiUtil.getCountryDetails();
        CountryApiUtil.getExistingCountryDetails();
        httpResponse res;
        CountryApiUtil.parseResponse(res);
        Map<string,CountryLayerAPIWrapper> cLMap = new Map<string,CountryLayerAPIWrapper> ();
        CountryLayerAPIWrapper cla = new CountryLayerAPIWrapper ();
        cla.name ='Test';
        cla.capital ='TestC';
        cla.alpha2Code = 'TE';
        cla.alpha3Code ='TES';
        cla.region = 'EMEA';
        cLMap.put( cla.name,cla);
        
        CountryLayerAPIWrapper claa = new CountryLayerAPIWrapper ();
        claa.name ='India';
        claa.capital ='TestCT';
        claa.alpha2Code = 'TA';
        claa.alpha3Code ='TAS';
        claa.region = 'ASIA';
        cLMap.put( claa.name,claa);
        CountryApiUtil.comAndUpdate(cLMap,cMap);
        test.stopTest();
    }
}