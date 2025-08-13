## Custom CRM Integrations
### AnywhereNow Dialogue Studio

## How to download and import in AnywhereNow Dialogue Studio
- use green download [Code] button, top right from [repository home](https://github.com/AnywhereNow/DialogueStudioFlows) or
- click on the .json file, click [raw] on top right, then ctl-A, ctl-C
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import, then ctl-V or select local file

## Flow Description
- Using the contact / cases endopints dialogue studio can serve a connection to a CRM system (outside of the supported systems) to present data in the WebAgent to an agent answering a call. This flow can also be modified to support the searching of contacts inside of the chosen CRM system

# Get Caller group
- [get] /api/v1/contact - endpoint that AnywhereNow core calls when an agent is hunted
- E164 Wildcard - Offers different formats of phone number to query CRM system (example is based on ServiceNow). Creates query string to send to CRM system, defines headers. 
- HTTP Request - Sends GET request to CRM system using URL defined in E164 Wildcard node
- create contacts - loops over returned value, creates array of objects to present to WebAgent
- HTTP Response - sends msg.payload back to WebAgent Client

# Get Cases Group
- [get] /api/v1/case - endpoint that AnywhereNow core calls when an agent selects cases tab
- Cases by Id - uses selected contact ID to create lookup query for CRM system, defines headers. 
- HTTP Request - sends GET request to CRM system using URL defined in Cases by Id node
- create cases - loops over returned information, creates array of objects to send back to cases tab
- HTTP Response - sends msg.payload back to WebAgent Client

# Get Token Group
- timestamp - defines how frequently Dialogue Studio refreshes access token
- tokenPayload - define headers, authentication information and token URL 
- http request - sends POST to CRM URL to retreive token
- store token - creates global variable storing access token

## Todo after Import
- Add connection information into 'Get Token' Group
- create query string URL inside of 'Get Caller' group
- update fields required in 'create contacts' node inside 'Get Caller' group
- update 'get token' group to create the payload to send to CRM service to retreive auth token, update timestamp node to run based on token expiry times
