@isTest
global class AnimalLocatorMock implements HttpCalloutMock{
    global HTTPResponse respond(HTTPRequest request){
        HTTPResponse response = new HTTPResponse();
        response.setHeader('content-type', 'application/json');
        response.setBody('{"animal": {"id":1,"name":"cow","eats":"grass"}}');
        response.setStatusCode(200);
        return response;
    }
}