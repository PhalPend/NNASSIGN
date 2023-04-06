@isTest
public class TestDataFactory {
    public static List<lead> createLeads(Integer numAccts , string coun) {
        List<lead> leads = new List<lead>();
        for(Integer i=0;i<numAccts;i++) {
            lead ld = new lead(LastName='TestLead' + i,country=coun,Company='abc');
            leads.add(ld);
        }
        insert leads;
        return leads;
    }
    
    public static country__c createCountry(string cName,string cReg, string cApha,string cAphaa) {
       country__c coun = new country__c() ;
        coun.country_name__c = cName;
        coun.alpha2code__c =cApha;
        coun.Alpha3code__c =cAphaa;
        coun.region__c = cReg;
        insert coun;
        return coun;
    }
}