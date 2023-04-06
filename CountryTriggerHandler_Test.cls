/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* This class contains all the test Methods for CountryTriggerHandler.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Phalguni Pendyala
* @modifiedBy     
* @maintainedBy   
* @version        1.0
**/

@isTest
public class CountryTriggerHandler_Test {

    @testSetup 
    static void createData(){
        country__c con = TestDataFactory.createCountry('Netherlands','EMEA','HL','NED');
        list<Lead> ld = TestDataFactory.createLeads(5,'Netherlands');
    }
    
    @isTest static void doCountryupdate(){
        country__c con =[select id,name,alpha2code__c from country__c];
        con.alpha2code__c ='NE';
        Test.startTest();
          update con;
        Test.stopTest();
          country__c upcon =[select id,alpha2code__c from country__c];
        system.assertEquals(upcon.alpha2code__c, 'NE');
    }
    
}