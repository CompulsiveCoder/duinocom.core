using System;
using System.IO.Ports;

namespace duinocom
{
	public class SerialClient
	{
		public SerialPort Port { get; set; }
		
        public string PortName { get; set; }
        public int BaudRate = 9600;
        
		public SerialClient (string portName, int baudRate)
		{
			PortName = portName;
			BaudRate = baudRate;
		}
		
		public SerialClient (SerialPort port)
		{
			Port = port;
			PortName = port.PortName;
			BaudRate = port.BaudRate;
		}
		
		public void Open()
		{
			throw new NotImplementedException();
		}
		
		public void Close()
		{
			throw new NotImplementedException();
		}
		
		public void Write(string message)
		{
			throw new NotImplementedException();
		}
		
		public string Read()
		{
			throw new NotImplementedException();
		}
	}
}

