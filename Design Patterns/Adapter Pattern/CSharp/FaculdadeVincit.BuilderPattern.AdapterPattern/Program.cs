using FaculdadeVincit.BuilderPattern.AdapterPattern;

var xmlMessage = new XmlMessage();
IJsonMessage adapterMessage = new XmlToJsonAdapter(xmlMessage);

var xml = xmlMessage.Xml;
var json = adapterMessage.Json;

System.Console.WriteLine("[XML]");
System.Console.WriteLine(xml);
System.Console.WriteLine("{JSON}");
System.Console.WriteLine(json);