public with sharing class SampleContinuationClass {
    // Callout endpoint as a named credential URL
    // or, as shown here, as the long-running service URL
    private static final String LONG_RUNNING_SERVICE_URL =
        'https://reqres.in/api/users?page=1';
    
        
    // Action method
    @AuraEnabled(continuation=true cacheable=true)
    public static Object startRequest(String Id) {
        System.debug(Id);
      // Create continuation. Argument is timeout in seconds.
        Continuation con = new Continuation(40);
        // Set callback method
        con.continuationMethod='processResponse';
        // Set state
        con.state='OK';
        // Create callout request
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(LONG_RUNNING_SERVICE_URL);
        // Add callout request to continuation
        con.addHttpRequest(req);
        // Return the continuation
        return con;
    }

    // Callback method
    @AuraEnabled(cacheable=true)
    public static Object processResponse(List<String> labels, Object state) {
        // Get the response by using the unique label
        HttpResponse response = Continuation.getResponse(labels[0]);
        // Set the result variable
        String result = response.getBody();
        system.debug(result);

        return result;
    }

}