# project-fundamentals
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Azure_Resource_Group.PNG)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above. Alternatively, select 
portions of the .yml file may be used to install only certain pieces of it, such as Filebeat.

This is a list of the playbook files:
- Filebeat-playbook.yml
- Metricbeat-playbook.yml
- pentest.yml
- install-elk.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

The load balancer protects applications from emerging threats, protects against DDoS attacks, authenticates user access, and simplifies PCI compliance.  

The jump box is a secure gateway and allows the user to access devices in a separate security zone through the use of a ssh key. Access will only be allowed if the user has this 
key.  

Filebeat monitors the specific log files and locations, while collecting the log events and sends them to Elasticsearch or Logstash for indexing. 
Metricbeat monitors the performance of the different servers in the environment. This information is then stored in Elasticsearch.

The configuration details of each machine may be found below. 

(Machine_Configuration_Table.PNG)


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox machine can accept connections from the internet. Access to this machine is only allowed from the following IP addresses:
98.206.232.151

Machines within the network can only be accessed by the jumpbox.
I allowed machine 98.206.232.151 to access the ELK VM through Port 5601. The ELK machine's private IP address is: 10.1.0.4

A summary of the access policies in place can be found in the table below.

(Access_Polices_Table.PNG)


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. Ansible is a free, open-source tool that is easy to set up. It is powerful, flexible and efficient. It allows you 
to have a highly complex IT workflow.  

The playbook implements the following tasks:
- Install docker, io
- Install pip3
- Install Docker Python Module
- Increase virtual memory
- Download and launch docker
 

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(docker_ps_output.png)


### Target Machines & Beats

I have successfully installed Filebeat and Metricbeat to monitor the three Web-VM’s.
This ELK server is configured to monitor the following machines:

- Web-VM-1: 10.0.0.5
- Web-VM-2: 10.0.0.6
- Web-VM-3: 10.0.0.7

Metricbeat allows the Elk server to monitor CPU and memory usage. It monitors information that comes in and out of the servers at specified time intervals. It collects metrics 
and statistics and then sends them to the output the user specifies, like Elasticsearch or Logstash. Filebeat logs files, and forwards their data to Logstash or Elasticsearch 
for indexing. Some examples of supported output options in Filebeat are cloud, Redis, and Kafka but Logstash and Elasticsearch are the most commonly used. 


### Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned follow the steps below to use 
the playbook. 

- SSH into the control node
- Copy the elk_install.yml file to ansible control 
  (install_elk_yml.PNG)
- Update the hosts file to include webserver and ELK
  (hosts_file.PNG)
- Run the playbook
- Navigate to Kibana to check that the installation worked as expected
  http://20.85.247.221:5601/app/Kibana#/home
  (Kibana_access.PNG)(Kibana_access.PNG)

The playbook files are .yml files that can be run with ansible. 
They are located in /etc/ansible/roles/filebeat-playbook.yml.
Copy the file into a container where ansible is installed to be deployed.
Update the hosts file in order for Ansible to run the playbook on a specific machine.
In the hosts file you can specify where you want resources to be installed under the specific machines grouping category. You can specify which machine to install the ELK server 
on versus which to install the Filebeat on. 
Navigate to http://20.58.247.221:5601/app/kibana, to verify the ELK server is running. 

The following are the specific commands the user will need to run the playbook, download the playbook, update the files, etc.
- Download the ansible.cfg file 
  (Ansible_configuration_file.PNG)
- Add the remote_user to the ansible.cfg file
- Add the VM that you want to use to run your ELK stack in the hosts file
  /etc/ansible/hosts , specify python with ansible_python_interpreter=/usr/bin/python3.
  (hosts_file.PNG)
- Create a new playbook: 
  touch /etc/ansible/install-elk.yml 
  (install_elk_yml.PNG)

Run the following commands to confirm the container is running and the playbook has updated properly:
- sudo docker start <container name>
- sudo docker ps
- sudo docker exec -ti <container name> bash
- sudo ansible-playbook <file_name.yml> 


