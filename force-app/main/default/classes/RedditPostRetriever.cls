public with sharing class RedditPostRetriever {
    private static final String endpoint = 'https://www.reddit.com/r/salesforce/hot.json?limit=1';
    private static final String GET = 'GET';

    public static List<SalesforceReddit.Data> getRedditData(){
        List<SalesforceReddit.Data> redditPosts = new List<SalesforceReddit.Data>();     

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod(GET);

        HttpResponse redditResponse = http.send(req);
        SalesforceReddit redditPostsResponse = SalesforceReddit.parse(redditResponse.getBody());
        List<SalesforceReddit.Children> child = redditPostsResponse.data.children;

        for(SalesforceReddit.Children s : child){
            redditPosts.add(s.data);
        }

        System.debug(redditPosts);

    	return redditPosts;
    }
}