@RestResource(urlMapping='/restInsertAccount/')
global with sharing class RestTest {

    global static String jobId { get; set;}
    global static String csv { get; set;}
    
    @HttpPost
    global static String RestAccount(){
        RestRequest resq = RestContext.request;
        List<String> listVariable = new List<String>{'"Nome","Sobrenome","Campanha"', '"Max","Matos","X1512"','"Talita","Castagnaro","X1512"'};

        
        System.debug('Requisição: ' + resq);
        System.debug('Body: ' + resq.requestBody.toString());

        ProcessoJob(resq.requestBody);
        
        return 'JOB Criado';
    }
    
    public static HttpResponse CriaJob(){
        HttpRequest reqCriaJob = new HttpRequest();
		reqCriaJob.setMethod('POST');
        reqCriaJob.setHeader('content-type', 'application/json' );
        reqCriaJob.setHeader('Authorization' ,'Bearer '+userInfo.getSessionId());
        reqCriaJob.setEndpoint('https://maxms-dev-ed.my.salesforce.com/services/data/v51.0/jobs/ingest');

        String body = '{ '+
            '"lineEnding": "CRLF",'+ 
            '"operation": "insert",'+ 
            '"object": "BulkCampanhaMember__c",'+ 
            '"contentType": "CSV"'+
        '}';
        
        reqCriaJob.setBody(body);
        
        Http hCria = new Http();
        HttpResponse responseCria = hCria.send(reqCriaJob);
        System.debug('Cria Job: '+ responseCria.getBody());
        return responseCria;
    }
    
    public static HttpResponse InsereDadosJob(Blob dadosCSV){
        HttpResponse respJobCriado = CriaJob();
        System.debug(respJobCriado.getBody());
        System.debug(respJobCriado.getStatusCode());
        if(respJobCriado.getStatusCode()<=299){
            Map<String,Object> respMap = (Map<String,Object>)System.JSON.deserializeUntyped(respJobCriado.getBody());
            jobId = (String)respMap.get('id');
            System.debug('Job: '+ jobId);
            HttpRequest reqDadosJob = new HttpRequest();
            reqDadosJob.setMethod('PUT');
            reqDadosJob.setHeader('Content-Type', 'text/csv');
            reqDadosJob.setHeader('Accept', 'application/json');
            reqDadosJob.setHeader('Authorization' ,'Bearer '+userInfo.getSessionId());
            reqDadosJob.setEndpoint('https://maxms-dev-ed.my.salesforce.com/services/data/v51.0/jobs/ingest/'+jobId+'/batches');
            
            reqDadosJob.setBodyAsBlob(dadosCSV);
            
            Http hDados = new Http();
            HttpResponse responseDados = hDados.send(reqDadosJob);
            System.debug('Insere dados Job: ' + responseDados.getBody());
            return responseDados;	
        }else
            return respJobCriado;
    }
    
    public static HttpResponse ProcessoJob(Blob dadosCSV){
        HttpResponse respDadosJob = InsereDadosJob(dadosCSV);
        System.debug('Job 2: '+ jobId);
        HttpRequest reqAtuJob = new HttpRequest();
        reqAtuJob.setMethod('PATCH');
        reqAtuJob.setHeader('Content-Type', 'application/json' );
        reqAtuJob.setHeader('Authorization' ,'Bearer '+userInfo.getSessionId());
        reqAtuJob.setEndpoint('https://maxms-dev-ed.my.salesforce.com/services/data/v51.0/jobs/ingest/'+jobId);
        
        String body = '{ "state" : "UploadComplete" }';
        
        reqAtuJob.setBody(body);
        
        Http hAtuJob = new Http();
        HttpResponse responseAtuJob = hAtuJob.send(reqAtuJob);
        System.debug('Atualiza dados Job: ' + responseAtuJob.getBody());
        return responseAtuJob;
    } 
}