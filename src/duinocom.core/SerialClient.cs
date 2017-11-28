using System;
using System.IO.Ports;

namespace duinocom
{
	public class SerialClient
	{
		public SerialPort Port { get; set; }
        
		public SerialClient (string portName, int baudRate)
		{
			Port = new SerialPort(portName, baudRate);
		}
		
		public SerialClient (SerialPort port)
		{
			Port = port;
		}
		
		public void Open()
		{
			Port.Open ();
		}
		
		public void Close()
		{
            Port.Close();
		}
		
		public void Write(string message)
		{
			Port.Write (message);
		}
		
		public void WriteLine(string message)
		{
			Port.Write (message);
		
			Port.Write (Port.NewLine);
		}
		
		public string WriteAndRead(string message)
		{
			WriteLine(message);
			
			return Read();
		}
	
		public string Read()
		{
			var returnMessage = String.Empty;
			int count = Port.BytesToRead;
			int intReturnASCII = 0;
			while (count > 0) {
				intReturnASCII = Port.ReadByte ();
				returnMessage = returnMessage + Convert.ToChar (intReturnASCII);
				count--;
			}

			return returnMessage.Trim();
		}
	}
}

