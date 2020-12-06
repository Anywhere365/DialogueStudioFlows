# Tutorial Base 1
### Anywhere365 Dialogue Studio
## Flow description
First time user of Dialogue Studio? This introduction flow is specially for you to learn the general nodes. What will we cover?
- Timestamp node to manually start a flow
- Function node to edit variables with Javascript
- Debug node
- Flow level variables
- HTTP In node and respnd with a webpage with custom values

![transcript flow minimal](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/TutorialBase1/resources/a365-ds-tutorial-base1-screenshot.png)

### Top flow
showcases the Timestamp node that you can click on the leftside button to start its flow. The Function nodes show different ways to display datetime formats. The Debug nodes. Can have one or more flows as input. Can show the msg.payload (default), all of msg.* values and third ISO date format. With Dialogue Studio you will often work with datatime so keep these examples handy!

### Middle flow
showcases the HTTP Request node to fetch or get information from a url. Here it is a quite large .json formatted text. Using the JSON node this is converted from plain text to a json object. Now you can reference specific values in the json hierarchy. The first Debug node shows the msg.payload object. Click in the debug area to expand the object and discover the hierarchy and values. The next 2 Debug nodes show specific values from the json hierarchy. In the Function node these 2 values are assigned to flow level variables. Then the flow ends.

To view the full json content copy paste the url,  https://data.buienradar.nl/2.0/feed/json , to your browser. Then ctl-A and ctl-C to copy the json text. Then paste in Visual Studio Code, on the bottom of the editor change the filetype to JSON. Then right click the content and choose Format document. Now it is human readable and makes sense, right?!

### Bottom flow
showcases the HTTP In node. Here we create a http://localhost:1880/anywhere365 endpoint. The Function node creates a webpage by glueing together string values, including the values from earlier populated flow level variables. Remember an HTTP in should always be paired with a HTTP Response node. See here the ![Nodered](https://cookbook.nodered.org/#http-requests) documentation details on HTTP requests. 

![transcript flow minimal](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/TutorialBase1/resources/a365-ds-tutorial-base1-debug.png)

![transcript flow minimal](https://github.com/Anywhere365/DialogueStudioFlows/blob/master/TutorialBase1/resources/a365-ds-tutorial-base1-htmlshot.png)


## How to download and import in Anywhere365 Dialogue Studio
- use green download [Code] button, top right from [repository home](https://github.com/Anywhere365/DialogueStudioFlows) or
- click on the .json file, click [raw] on top right, then ctl-A, ctl-C
- Goto hamburger menu, top right, in Dialogue Studio
- Choose Import, then ctl-V or select local file