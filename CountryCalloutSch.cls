/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* This Schedulable class invokes Country Layer API and scheduled every day.
* This class uses CountryApiUtil for the callout to perform 
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Phalguni Pendyala
* @modifiedBy     
* @maintainedBy   
* @version        1.0
**/

public class CountryCalloutSch implements schedulable {
    public void execute(SchedulableContext sc){
        try{
            CountryApiUtil.getCountryDetails();
        }catch (exception e) {
            
        }
        
    }
}