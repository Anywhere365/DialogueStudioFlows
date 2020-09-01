## Minimal Order Beer Bot for Teams and Skype
### Anywhere365 Dialogue Studio
## Flow description
Easy example for a chat bot. You are greeted with Welcome <customersipaddress@domain>, asked how many beer you want to order, only accept '6' or 'six' then ship confirmation or just bye. Each chat is a new session and gets a new dialogueid because of the Disconnect node.

![translate chat minimal](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/OrderBeerBotChat/resources/a365-ds-orderbeerbot-chat.png)

## How to import in Anywhere365 Dialogue Studio
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import
- Select the .json file downloaded from github  or
- Paste the content from the .json file on github

## Requirements
- Make sure you have configured a Chat endpoint for your ucc, see [Golive](https://golive.anywhere365.io/platform_elements/core/userguide/ucc_config_endpoints.html)

## Todo after Import
- Change Server name and ucc name in Incoming node

## set msg.hello node
Creates new property msg.hello Uses a [Jsonata](http://docs.jsonata.org/overview.html) expression "'welcome ' & msg.session.sipUri" to populate msg.hello

## Say: hello node
Uses the msg.hello property

## Wait for Chat message (20s) node
forwards the customer typed text or (timeout) repeats earlier Say: how many beer?

## 6 or six or other node
chechs values and forwards to message and disconnect node