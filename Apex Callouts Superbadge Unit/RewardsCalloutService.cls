public class RewardsCalloutService {

    public static HttpResponse callOutUserRewards(String jsonBody) {
    
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:IntegrationSB__BalancedLiving/rewards');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json'); 
        req.setBody(jsonBody);
        Http http = new Http();
        HttpResponse res;

        // Log the request
        System.debug('Request Body: ' + jsonBody);
        System.debug('Request Headers: ' + req.getHeader('Content-Type'));
        
        try {
            res = http.send(req);
            // Log the response status and body
            System.debug('Response Status: ' + res.getStatus());
            System.debug('Response Status Code: ' + res.getStatusCode());
            System.debug('Response Body: ' + res.getBody());
        } catch (Exception e) {
            System.debug('Error: ' + e.getMessage());
            throw e;
        }

        return res;
    }

}
