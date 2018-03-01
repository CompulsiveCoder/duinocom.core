using System;
using System.IO.Ports;

namespace duinocom
{
	public class SerialPortDetector
	{
		public int BaudRate = 9600;

		public SerialPortDetector ()
		{
		}

		public SerialPortDetector (int baudRate)
		{
			BaudRate = baudRate;
		}

		public SerialPort Detect()
		{
			try
			{
				string[] portNames = SerialPort.GetPortNames();

				for (int i = portNames.Length-1; i > 0; i--) // Iterate backwards because the port is often at the end.
				{
					var portName = portNames[i];

					var port = new SerialPort(portName, BaudRate);

					port.Open();

					if (port.IsOpen)
					{
						return port;
					}
				}
			}
			catch (Exception)
			{
			}

			return null;
		}

		public string DetectName()
		{
			var port = Detect ();
			if (port != null)
				return port.PortName;

			return String.Empty;
		}
	}
}

