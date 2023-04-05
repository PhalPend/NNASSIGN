Problem Statement  1 #: 


 With API from https://countrylayer.com/ upload information to Salesforce about countries specifically we
 are interested in Name, Country alpha2code and alpha3code, Capital city, region, regionalBlocs (acronyms
 are sufficient).
 Once a day, check if any of the information on the API has been changed and if so, update it in Salesforce.
 Then create a trigger that will show the information on the leads based on their countries. Create tests for
 the feature to be ready for deployment.

Solution Direction :


  Created a Trail Account to perform  Callout to CountryLayer API Service using an API key.
	
	
  Authentication is handled by API key which is passed in URL parameter of GET request.
	
  Created a Remote SiteSetting "CountryAPI" to whitelist the Endpoint "http://api.countrylayer.com".
	
	
	
<img width="680" alt="image" src="https://user-images.githubusercontent.com/129977066/230226426-a6cd997c-dc7a-4965-b377-274631ee5826.png">

  
	

	
Created Custom MetaData to Store Endpoint , Method name and APi key for easier maintenance.
	
	

	
  ![image](https://user-images.githubusercontent.com/129977066/230226274-a4ca90c3-be1e-40e3-ad95-6ab50f35f467.png)

Created Custom object "Country__c" to Store Country Specific data which is fetched from API.
	
Created a Country_Name__c fields as External Id which will be used for Upsert on Country Object based on Data Changes from the API.
  
  <img width="818" alt="image" src="https://user-images.githubusercontent.com/129977066/230222678-db24a2ec-f29d-44e6-94e7-a0b3c00e6869.png">
  
	
	
Created a Generic HTTP callout class which can be used across different HTTP callouts by passing parameters.
	
Created a schedulable Interface  "CountryCalloutSch" to fetch the Data everyday once and Compare with existing Data to apply changes to Data.


Created a Wrapper class "CountryLayerAPIWrapper" to parse all the Response atrributes from the callout (Mapped all of the Response Attributes for the Future use)


Created @Future method in CountryApiUtil to handle callout from Schedule interface.


CountryApiUtil also contains method to compare Data changes and update the Country Data on Daily basis.
	
	
  ![image](https://user-images.githubusercontent.com/129977066/230226807-13e7762b-0732-4f13-ad1d-d0698870a75b.png)

Created a Error Handler Big Object to capture all the Errors and issues related to the code.

Created Mock Response classes for the Callout 


<img width="702" alt="image" src="https://user-images.githubusercontent.com/129977066/230227749-f1e54202-9a7e-45c0-b84e-d8d098ac20dd.png">

Created a Trigger Handler Framework for the Triggers.

Created a CountryTriggerHandler Class to handle After update event to update corresponding leads associated with Country when the countries Data gets updated

Created Test Data Factories for the Test classes Data Setup.

All Test classes coverages are above 90% 

Validation Rule on the Lead when Owner has been changes is also implemented 

Flow to Capture owner since field is also been Implemented 


