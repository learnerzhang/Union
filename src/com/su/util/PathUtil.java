package com.su.util;

import java.io.IOException;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.InterfaceAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

public class PathUtil{
	public static String getServerIp() {
		try { 
            for (Enumeration<NetworkInterface> e = NetworkInterface.getNetworkInterfaces(); e.hasMoreElements();) { 
                NetworkInterface item = e.nextElement(); 
 
                for (InterfaceAddress address : item.getInterfaceAddresses()) { 
                    if (address.getAddress() instanceof Inet4Address) { 
                        Inet4Address inet4Address = (Inet4Address) address.getAddress(); 
                        System.out.println(inet4Address.getHostAddress()); 
                        System.out.println(inet4Address.isLinkLocalAddress() + " " + inet4Address.isLoopbackAddress() + " " + inet4Address.isMCGlobal() + " " + inet4Address.isMulticastAddress()); 
                    } 
                } 
            } 
        } catch (IOException ex) { 
 
        }
		return null;
	}
}
