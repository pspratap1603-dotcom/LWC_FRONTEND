public class LinkedInIntegration {

    // 🔹 1. Call this method to post a message on LinkedIn
    public static void postOnLinkedIn(String message) {
        String memberId = loginToLinkedIn();
        if (memberId != null) {
            postMessage(memberId, message);
        } else {
            System.debug('Failed to get LinkedIn Member ID.');
        }
    }

    // 🔹 2. Get LinkedIn user ID using the /me endpoint
    public static String loginToLinkedIn() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:LinkedIn/v2/me');
        req.setMethod('GET');

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            Map<String, Object> data = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            return (String) data.get('id');  // LinkedIn returns user ID as 'id'
        } else {
            System.debug('Error getting LinkedIn user: ' + res.getBody());
            return null;
        }
    }

    // 🔹 3. Post a message to the LinkedIn feed
    public static void postMessage(String memberId, String message) {
        String authorUrn = 'urn:li:person:' + memberId;

        String body = '{' +
            '"author": "' + authorUrn + '",' +
            '"lifecycleState": "PUBLISHED",' +
            '"specificContent": {' +
                '"com.linkedin.ugc.ShareContent": {' +
                    '"shareCommentary": {' +
                        '"text": "' + message + '"' +
                    '},' +
                    '"shareMediaCategory": "NONE"' +
                '}' +
            '},' +
            '"visibility": {' +
                '"com.linkedin.ugc.MemberNetworkVisibility": "PUBLIC"' +
            '}' +
        '}';

        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:LinkedIn/v2/ugcPosts');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('X-Restli-Protocol-Version', '2.0.0');
        req.setBody(body);

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 201) {
            System.debug('Post successful!');
        } else {
            System.debug('Post failed: ' + res.getStatusCode() + ' - ' + res.getBody());
        }
    }
}