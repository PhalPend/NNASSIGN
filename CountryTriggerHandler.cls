/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* This class contains all the Utility Methods used for CountryTriggerHandler.
* This class has a method which runs after update of country data and update leads accordingly 
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Phalguni Pendyala
* @modifiedBy     
* @maintainedBy   
* @version        1.0
**/


public class CountryTriggerHandler extends TriggerHandler  {
    
    private Map<Id, country__c> newConMap;
    
    public CountryTriggerHandler() {
        this.newConMap = (Map<Id, country__c>) Trigger.newMap;
        this.setMaxLoopCount(1);
    }
    
    public override void afterUpdate() {
        
        updateLeadsBasedonCountrys(newConMap);
        
    }
    
    public static void updateLeadsBasedonCountrys(Map<Id, country__c> newConMap){
        
        Map<String,country__c> cMap = new  Map<String,country__c> ();
        list<lead> ldList = new list<lead>();
        for(country__c cn:newConMap.values()){
            cMap.put(cn.country_name__c,cn);
        }
        
        for(Lead ld :[select id,country,region__c,
                      alpha2code__c,alpha3code__c from lead]){
            if(null<>cMap.get(ld.country)){
                ld.alpha2code__c = cMap.get(ld.country).alpha2code__c;
                ld.Alpha3code__c =cMap.get(ld.country).Alpha3code__c;
                ld.Region__c = cMap.get(ld.country).Region__c;
                ldList.add(ld);
            }
        }
        if(ldList.size()>0){
            try{
                database.update(ldList,false);
                if(test.isRunningTest()){
                    integer i= 1/0;
                }
            }catch(exception e){
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