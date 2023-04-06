/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* This class contains Mock Response  to Parse JSON  for Generic HTTP Request Implementation 
  which is used in HttpCalloutWrapper 
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Phalguni Pendyala
* @modifiedBy     
* @maintainedBy   
* @version        1.0
**/

@isTest
global with sharing class HttpServiceCalloutMock {
//A single method that acts as a webservice to simulate 3rd party services
	public HTTPResponse respond(HTTPRequest req, string JsonMockResponse){
		//Look at the httpRequest that was sent via Apex to possibly determine how we will respond
		system.debug(req.getBody());
		system.debug(req.getMethod());
		system.debug(req.getEndpoint());
        
		//Construct the object that we want to respond with
        string response = JsonMockResponse;
            
        //Instantiate a new httpResponse
		httpResponse res = new httpResponse();

		//Set the Status
		res.setStatus('OK');

		//Set the StatusCode
		res.setStatusCode(200);

		//Set the Body to the serialized form of the instance of the the object created
		res.setBody(response);
        
        //Return the httpResponse
		return res;
    }
}