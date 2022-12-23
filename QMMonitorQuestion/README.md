## QM Monitor Question
### Anywhere365 Dialogue Studio
## Flow description
Use the QM Monitor Question node to ask the customer Quality monitor questions

This is only a flow to show how the QM nodes are qorking in Dialogue Studio and not realistic. You have to adjust it to your needs
The Quality monitor is used to get caller feedack after the agent left the conversation

![QM Monitor Questions flow](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/QMMonitorQuestion/resources/qmflow.png)

## How to download and import in Anywhere365 Dialogue Studio
- use green download [Code] button, top right from [repository home](https://github.com/Anywhere365/DialogueStudioFlows) or
- click on the .json file, click [raw] on top right, then ctl-A, ctl-C
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import, then ctl-V or select local file

## Requirements
- You need to enable QM questions in your ucc and configure Questions in your SPO page. 
- In your SPO QM Questions you have to set the "Plugin Name" to "NodeRedPlugin"

## Todo after Import
- Change Server name and ucc name in QM Monitor Question node


## Important to know 
- it is possible to create QM Questions in SPO and mark the "Plugin Name" as "NodeRedPlugin". So that the question will be send to DS
- for each question a msg.object will arrive at the QM Question node. it will contain  "questionid,welcometext,goodbyetext,valuestartrange,valueendrange and session information like a normal call
![QM Monitor Questions debug](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/QMMonitorQuestion\resources/sampledebug.png)
- you cannot tranfer the call to a skill or VM or somewhere else in the stage
- you have to save the incoming msg.payload after the QM Question node because you need to send this payload into the QM answer node
- you can use the Ask-And-Wait node to request an answer from the Caller but you have to save the answer because the db entry will be made (from the ucc) after the last question is answered so you have to update the entries in the db when the call is ended
- the CDR db will store the result in the "UCC_QMResults" table and creates an entry for each question
![QM Monitor Questions cdr sample](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/QMMonitorQuestion\resources/cdrsample.png)


