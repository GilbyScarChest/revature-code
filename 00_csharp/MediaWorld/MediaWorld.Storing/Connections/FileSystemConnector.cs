using System.Xml.Serialization;
using System.Collections;
using MediaWorld.Domain.Models;
using System.Collections.Generic;
using MediaWorld.Domain.Abstracts;
using System.IO;

namespace MediaWorld.Storing.Connections
{
    public class FileSystemConnector
    {
        private const string _path = @"storage.mxl";

        public List<AMedia> ReadXml(string path = _path)
        {
            var xml = new XmlSerializer(typeof(List<AMedia>));
            var reader = new StreamReader(path);
            return xml.Deserialize(reader) as List<AMedia>;
        }

        public void WriteXml(List<AMedia> data, string path = _path)
        {
            var xml = new XmlSerializer(typeof(List<AMedia>));
            var writer = new StreamWriter(path);
            xml.Serialize(writer, data);
        }
    }
}