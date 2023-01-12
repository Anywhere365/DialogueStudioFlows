## How to connect to MS Dynamics Online
### Anywhere365 Dialogue Studio

We connect to Microsoft Dynamics Online through the MS Graph connection

## How to download and import in Anywhere365 Dialogue Studio
- use green download [Code] button, top right from [repository home](https://github.com/Anywhere365/DialogueStudioFlows) or
- click on the .json file, click [raw] on top right, then ctl-A, ctl-C
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import, then ctl-V or select local file


## Todo after Import
- create an appid and secret on MS Graph and give this app enough rights to access MS Dynamics data (see Microsoft documentation)


## Description

An AccessToken (AT) from MS Graph is only valid for a period of time, so we first check if the existing AT is still valid

If it is not valid, we request a new AT and save it in a global variable. This gives the possibility to use the AT in each flow.

To make it more easy to follow the flow, we create a sublflow for the AT check and creation<br>
![standard sample Dynamics Online Subflow](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/DynamicsOnlineintegration/resources/a365-dynonlinesamplepng.png)
Inside this flow we setup first a msg.time to have the actual time. In the switch afterwards we check this time against the global variable dynexp which is the endtime of the AT. If the time is not reached, the flow continues to the output. If the time has reached we start the creation of a new token
Inside the function node we set the method to POST, the header to the correct content type and create a payload. This payload contains the clientid (appid), the client secret, the ressource (your dynamics url) and the grant_type
The url has to contain the tenant id
After we get the token from graph, we first check if the answer from graph is a statuscode 200. If this is not the case, something went wrong. So you can extend the switch with an extra output where you can create a flow to make something (maybe send an email) to inform the IT that the creation went wrong.
If it is 200, we save the AT in a global variable and create another global variable with a timstamp that points to the lifetime end of the AT. In our case it is +1 hour because the lifetime is 3600 seconds.
After that we exit the subflow

![standard sample Dynamics Online Subflow](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/DynamicsOnlineintegration/resources/a365-dynonlinesublow.png)
In the "set query" function we create the URL to request dynamics
Important in the header is the Authorization to contain the AT
Now the method will be GET because in this sample we want to read information from Dynamics. 
To selcet contact information the link should point to "/api/data/v9.2/contacts" if you need account information it should point to "/api/data/v9.2/accounts". The result should use filter to not get all entries :-). we use a filter to select the "telepphone1" entry from dynamics
We also add a Select filter to only get information that I need and not all. This speeds up the answer a lot

