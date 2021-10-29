## Salesforce Integration
### Anywhere365 Dialogue Studio
## Flow description
This Salesforce Integration gets the caller Sip and checks if this user has an open case in Salesforce. If there is no data coming back from Salesforce we create an account and creates a case in Salesforce and sends the call to the servicedesk

![SalesforceIntegration](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/Salesforceintegration/resources/a365-ds-salesforceintegration.png)

## How to download and import in Anywhere365 Dialogue Studio
- use green download [Code] button, top right from [repository home](https://github.com/Anywhere365/DialogueStudioFlows) or
- click on the .json file, click [raw] on top right, then ctl-A, ctl-C
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import, then ctl-V or select local file

## Requirements
- Make sure you have a Salesforce App account

## Todo after Import
- Change Server name and ucc name in Incoming node
- Create an Salesforce connection 
- Add the Salesforce connection at each Salesforce node
- Change the Action nodes to your skills

