@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse response_country = 
            new ParkService.byCountryResponse();
        List<String> lstOfDummyParks = New List<String> { 'park1', 'park2', 'park3' };
        response_country.return_x = lstOfDummyParks;
        // end
        response.put('response_country', response_country); 
   }
}