"""
This component is used to control the flows during a network migration in a test network.

Authored by: Nikhil Khatu for the NCSU ECE570 Course.
"""

from pox.core import core
from pox.lib.addresses import IPAddr, EthAddr
import pox.openflow.libopenflow_01 as of


log = core.getLogger()



class migrate (object):

    def __init__ (self, connection):
        
        self.connection = connection
        connection.addListeners(self)
    
        #(keys are MACs, values are ports).
    	self.mactable = {}
    
    def send_packet (self, buffer_id, raw_data, out_port, in_port):
        msg = of.ofp_packet_out()
        msg.in_port = in_port
    
        if buffer_id != -1 and buffer_id is not None:
            msg.buffer_id = buffer_id
        elif raw_data is None: return
        else: msg.data = raw_data
        
        action = of.ofp_action_output(port=out_port)
        msg.actions.append(action)
        
        self.connection.send(msg)
    
       

    def _handle_PacketIn (self, event):

        parsed_data_packet = event.parsed
        openflow_packet = event.ofp

        self.mactable[parsed_data_packet.src] =  openflow_packet.in_port
        if parsed_data_packet.dst not in self.mactable: self.send_packet(openflow_packet.buffer_id, openflow_packet.data, of.OFPP_FLOOD, openflow_packet.in_port) 
        
        elif parsed_data_packet.dst == EthAddr("08:00:27:2d:2f:e2"):
            #print 'Out port1: ', self.mactable[parsed_data_packet.dst], 'Destination address: ', parsed_data_packet.dst
            msg = of.ofp_flow_mod()
            msg.command = of.OFPFC_MODIFY_STRICT
            msg.match.dl_dst = EthAddr("08:00:27:2d:2f:e2")
            msg.match.dl_src = EthAddr("08:00:27:89:cd:69")
            msg.match.nwsrc = "10.1.1.3/24"
            msg.hard_timeout = 30
            
            
            action_one = of.ofp_action_nw_addr.set_dst(IPAddr("10.5.6.34"))
            msg.actions.append(action_one)
            action_two = of.ofp_action_output(port = 3)
            msg.actions.append(action_two)
        
            self.connection.send(msg)
            
        else:
            self.send_packet(openflow_packet.buffer_id, openflow_packet.data, self.mactable[parsed_data_packet.dst], openflow_packet.in_port)
            #print 'Out port2: ', self.mactable[parsed_data_packet.dst], 'Destination address: ', parsed_data_packet.dst





def launch ():
    def start_switch (event):
        log.debug("Controlling %s" % (event.connection,))
        migrate(event.connection)
    
    core.openflow.addListenerByName("ConnectionUp", start_switch)
