## How to save Transcript and recording URL to MS Dynamics Online phone activity
### Anywhere365 Dialogue Studio

We connect to Microsoft Dynamics Online through the MS Graph connection for authentication

![standard sample to write transcript and recording url to phone activity in Dynamics](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/DynamicsPutTranscriptandRecordinginActivity/resources/a365-dynsample001.png)

## How to download and import in Anywhere365 Dialogue Studio
- use green download [Code] button, top right from [repository home](https://github.com/Anywhere365/DialogueStudioFlows) or
- click on the .json file, click [raw] on top right, then ctl-A, ctl-C
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import, then ctl-V or select local file


## Todo after Import
- create an appid and secret on MS Graph and give this app enough rights to access MS Dynamics data (see Microsoft documentation)
- add the account details to the "create token request" function node
- change the URL in the "Create Dyn request" function, "write URL to activity" function and "write URL to activity" function nodes
- setup the transcriptor in your ucc


## Description

![Pre Dialogue Phase](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/DynamicsPutTranscriptandRecordinginActivity/resources/a365-dynsample002.png)

In the Pre-Dialogue phase we make sure to save the caller phone number into a flow variable. The flow variable has the name "phnr"+ correlationId. Because the correlation id is a unique identifier. We use the msg.session.Id for this

![In Dialogue Phase](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/DynamicsPutTranscriptandRecordinginActivity/resources/a365-dynsample003.png)

In the InDialogue phase we use the transcriptor node inside customer and agent path. In the function we add to each line if this is from the agent, or from the customer. And we write each line into a text file. The name of the text file is again the correlation id with a ".txt" added to it

![Post Dialogue Phase](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/DynamicsPutTranscriptandRecordinginActivity/resources/a365-dynsample004.png)

If the call is ended, the recording of the call is saved in SPO and the link to it is send via an Event information towards Dialogue Studio.
In DS we use the eventbus to get the "DialogueRecordingSavedEvent". After that we check if the link contains the correct ucc, where we want to use the url


An AccessToken (AT) from MS Graph is only valid for a period of time, so we first check if the existing AT is still valid

![Check date](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/DynamicsPutTranscriptandRecordinginActivity/resources/a365-dynsample005.png)

If it is not valid, we request a new AT and save it in a global variable. This gives the possibility to use the AT in each flow.


Inside this flow we setup first a msg.time to have the actual time. In the switch afterwards we check this time against the global variable dynexp which is the endtime of the AT. If the time is not reached, the flow continues to the output. If the time has reached we start the creation of a new token

![Get Token](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/DynamicsPutTranscriptandRecordinginActivity/resources/a365-dynsample006.png)

Inside the function node we set the method to POST, the header to the correct content type and create a payload. This payload contains the clientid (appid), the client secret, the ressource (your dynamics url) and the grant_type
The url has to contain the tenant id
After we get the token from graph, we first check if the answer from graph is a statuscode 200. If this is not the case, something went wrong. So you can extend the switch with an extra output where you can create a flow to make something (maybe send an email) to inform the IT that the creation went wrong.
If it is 200, we save the AT in a global variable and create another global variable with a timstamp that points to the lifetime end of the AT. In our case it is +1 hour because the lifetime is 3600 seconds.
After that we exit the subflow

![Get last phone activity entry](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/DynamicsPutTranscriptandRecordinginActivity/resources/a365-dynsample007.png)

In the "create dyn request" function we create the URL to request dynamics the latest phone activity entry for the caller number. For this we request the flow variable which we saved in the PreDialoguePhase
Important in the header is the Authorization to contain the AT
Now the method will be GET because in this sample we want to read information from Dynamics. 
To selcet phone activity information the link should point to "/api/data/v9.2/phonecalls".The result should use filter to not get all entries :-). we use a filter to select the latest entry and only the first of this list
 We need this query to get the phone activity id to change the content of it

 ![Write entries](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/DynamicsPutTranscriptandRecordinginActivity/resources/a365-dynsample008.png)

With the switch "Answer > 0" we check if we get an phone activity for this caller

if we get no entry, we will delete the saved transcript

with the result from MS Dynamics we start two flows
1.
we write the URL from the eventbus information in a field inside the phone activity and wait 5 seconds before deleting the transcript
2.
we wait 2 seconds to not write at the same time in the same phone activity and read the transcript file to save it in the phone activitiy


