# Customer chat with Agent and bidirectional translate
### Anywhere365 Dialogue Studio
## Flow description
This Anywhere365 Dialogue Studio flow describes minimal two way translation chat flow between Customer and Agent. We use the Anywhere365 build in Translate node and the Google Translation service.

On top you see a very simple flow that greets incoming chats with 'hi friend', then forwards to a chatskill to hunt for an available Agent.

Then on the left side we have the 'InDialogue Started (Chat)' node. This triggers/starts when an Agent answers the hunt and joins the chat call. It has 2 outputs, one for the Customer and one for the Agent. Each output will forward session information, chat text from  and you can send custom chats back with the Say node, targeted to either the Customer or the Agent.

To enable continuous chat each participant has 2 loops attached. One loop to wait for and handle an incoming chat, translate and put the translated result in a flow level variable. A second loop to check if there is a new (translated) chat from the other participant, if so use the flow level variabele in the Say node to put it in the chat dialogue. 
Chats are always forwarded and the translation added, to the other participant. If a participant does not type for 60 seconds a 'wazzup' for customer or 'sleepy' text is added in the specific dialogue. 
By default this flow comes somewhat chatty, that is to signal what code is executing, nice during development. After the Delay nodes there is an empty Function node, they are there just to visualize the spagetti wires better.

![agent chat with translate flow](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/AgentChatwithTranslate/resources/a365-ds-agentchattranslate-sceenshot.png)


## How to import in Anywhere365 Dialogue Studio
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import
- Select the local .json file downloaded from github  or
- Paste the content of the .json file from github (click Raw, select all, copy)

## Requirements
- your Google translate APIkey in Sharepoint, see Golive
- UCC chat modality endpoint, chatskill and agent assigned

## Todo after Import
- Change Server name and ucc name in Incoming and InDialogue node
- Make sure the chat skill exists and has agents assigned, or edit

## Notes
Scenario is for 1 on 1 chat. This flow is tested with Android mobile consumer Skype client for the customer part and Skype for Business client for the Agent role. Tested with Anywhere365 Core 8.1 and Dialogue Studio 8.0.0.49231.

## Next steps
Now the session can be ended by the Agent by closing the chat window in Skype or Teams client.
You will want to change the messages like 'hi friend', 'wazzup', 'sleepy' for your scenario. Also the Wait for chat timeout  of 60 sec is ok for development but can be much higher for production. You can eliminate (part) of the UCC generated chat messages.
