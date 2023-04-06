/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* This is test clas Schedulable class CountryCalloutSch.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Phalguni Pendyala
* @modifiedBy     
* @maintainedBy   
* @version        1.0
**/

@isTest
public class CountryCalloutSch_Test {
    
    @isTest static void contactUpdateTest_Schedule() {
        
        
        // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String CRON_EXP = '0 6 * * * ?';
        
        Test.startTest();
        
        String jobId = System.schedule('Update Countries', CRON_EXP, new CountryCalloutSch());
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        
        Test.stopTest();
    }
}