/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* This class contains Mock Response  to Parse JSON  for Country Layer API.
* Response form the Api will be mapped into corresponding Country_c Object Fields 
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Phalguni Pendyala
* @modifiedBy     
* @maintainedBy   
* @version        1.0
**/

@isTest
global class MockCountryLayerAPIHttpResponse implements HttpCalloutMock{
    final String JSONMOCKRESPONSE = '{"name":"Afghanistan","alpha2Code": "AF","capital": "Kabul","alpha3Code": "AFG","region": "ASIA"}';
    
    global HTTPResponse respond(HTTPRequest req) {
        // Create a fake response
        HttpResponse res = new HttpResponse();      
        res.setBody(JSONMOCKRESPONSE);
        res.setStatusCode(200);
		res.setStatus('OK');
        return res;
    }
}