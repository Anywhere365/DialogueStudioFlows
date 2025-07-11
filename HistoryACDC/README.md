## History for the attendant console direct cloud (ACDC)
### AnywhereNow Dialogue Studio
## Flow description
Uses an endpoint /history to provide call history for an attendant user in the ACDC
![Screenshot001](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/HistoryACDC/resources/Screen001.png?raw=true)

## How to download and import in Anywhere365 Dialogue Studio
- use green download [Code] button, top right from [repository home](https://github.com/Anywhere365/DialogueStudioFlows) or
- click on the .json file, click [raw] on top right, then ctl-A, ctl-C
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import, then ctl-V or select local file

## Requirements
- Needs a SQL connection to your CDR database (don't forget to enable DS to connect to the SQL in your firewall)
	- needs the MSSQL-plus node (node-red-contrib-mssql-plus)
	- needs the moment node (node-red-contrib-moment)


## Todo after Import
- Create SQL connection
- create entry to your DS instance in your attendant view and send your query including "[CONTEXT]"
![Screenshot002](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/HistoryACDC/resources/screen002.png?raw=true)


