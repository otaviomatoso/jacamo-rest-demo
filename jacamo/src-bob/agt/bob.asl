// JaCaMo-REST: Integration Demo (Node-RED + MQTT)

/* Initial beliefs and rules */
topic("mqtt/jacamo/alice").

// goal triggered by Node-RED after the creation of dummy artifact
+!focus(Art,Ws) : .my_name(Me) & topic(Topic)
  <- .print("New dummy artifact detected");
     joinWorkspace(Ws,WsId);
     lookupArtifact(Art,ArtId)[wid(WsId)];
     focus(ArtId)[wid(WsId)];
     .concat("Hi from ", Me, Msg);
     Publish =.. [publish,[Topic,Msg],[]];
     .print("Sending a message to the MQTT broker (alice topic) via dummy artifact");
     .print("Message: ", Msg);
     act(Publish, Res);
  .

+message(M)[source(S)]
  <- .print("New message: ", M);
     .print("Source: ", S);
  .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
// { include("$jacamoJar/templates/org-obedient.asl") }
