import socket
import threading
from datetime import datetime

# Port mapping for professional output
SERVICES = {
    21: "FTP", 22: "SSH", 23: "Telnet", 25: "SMTP",
    53: "DNS", 80: "HTTP", 443: "HTTPS", 3306: "MySQL",
    3389: "RDP", 8080: "HTTP-Proxy"
}

def scan_port(ip, port):
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(1)
        result = sock.connect_ex((ip, port))
        if result == 0:
            service = SERVICES.get(port, "Unknown Service")
            print(f"[+] Found: Port {port} | Service: {service}")
        sock.close()
    except:
        pass

def main():
    print("-" * 50)
    print("   PRO-SCANNER v1.0 | Created for GitHub")
    print("-" * 50)
    
    target = input("Target IP or Hostname: ")
    print(f"Scanning started at: {datetime.now()}")
    print("-" * 50)

    # Creating threads to make it super fast
    for port in range(1, 1024):
        t = threading.Thread(target=scan_port, args=(target, port))
        t.start()

if __name__ == "__main__":
    main()
