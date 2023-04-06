/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* This class is used to Build HTTP Request and has a method to take different paramters about 
  Methods, Endpoint and Authentications
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Phalguni Pendyala
* @modifiedBy     
* @maintainedBy   
* @version        1.0
**/


public class HttpCalloutWrapper {

    // Method to perform a callout and return an httpResponse
    public static HttpResponse callout(String httpMethod, String url, String body){
        //Instantiate an httpRequest and set the required attributes
        HttpResponse res;
        HttpRequest req = new HttpRequest();
        req.setMethod(httpMethod);
        req.setEndpoint(url);
         
        //You can adjust the timeout duration (in milliseconds) to deal with slow servers or large payloads
        req.setTimeout(120000);

        //Invoke webservice callout
        system.debug('request send' + res );
       
            res = new http().send(req);
        
        
        System.debug('HTTP response body:' + res.getBody());
               
        return res;
    
    
    }
}