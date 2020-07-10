// JaCaMo-REST: Integration Demo (Node-RED + MQTT)

/* Initial beliefs and rules */
topic("mqtt/jacamo/bob").

// goal triggered by Node-RED after the creation of dummy agent
+!start : .my_name(Me) & topic(Topic)
  <- .print("New dummy agent detected");
     .concat("Hi from ", Me, Msg);
     .print("Sending a message to the MQTT broker (bob topic) via dummy agent");
     .print("Message: ", Msg);
     .send(mqtt, achieve, publish_mqtt(Topic,Msg));
  .

+message(M)[source(S)]
  <- .print("New message: ", M);
     .print("Source: ", S);
  .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
// { include("$jacamoJar/templates/org-obedient.asl") }
