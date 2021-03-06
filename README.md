# project-fundamentals
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Homework 12 Final Diagram](https://user-images.githubusercontent.com/91024338/135767142-f636bcec-e3e4-414d-8021-eeba6bae229b.PNG)

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

![Project 1 3 10](https://user-images.githubusercontent.com/91024338/135767176-4d252011-60e2-426c-9737-0d87ac3a8f2f.PNG)


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox machine can accept connections from the internet. Access to this machine is only allowed from the following IP addresses:
98.206.232.151

Machines within the network can only be accessed by the jumpbox.
I allowed machine 98.206.232.151 to access the ELK VM through Port 5601. The ELK machine's private IP address is: 10.1.0.4

A summary of the access policies in place can be found in the table below.

![Project 1 31 10](https://user-images.githubusercontent.com/91024338/135767183-4408ca34-77ed-4fc4-958c-90a21361b763.PNG)


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

![Project 1 4 3](https://user-images.githubusercontent.com/91024338/135767187-7d771ac5-a965-4d83-be30-9300993497d8.PNG)


### Target Machines & Beats

I have successfully installed Filebeat and Metricbeat to monitor the three Web-VM???s.
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
![install_elk_yml](https://user-images.githubusercontent.com/91024338/135767328-bcaa7e8f-17db-4548-b751-47032fb23f77.PNG)

- Update the hosts file to include webserver and ELK
![Project 1 6 1](https://user-images.githubusercontent.com/91024338/135767207-f67c8b12-0144-4a12-a733-bf5494043fcf.PNG)

- Run the playbook
- Navigate to Kibana to check that the installation worked as expected
  http://20.85.247.221:5601/app/Kibana#/home
![Project 1 6 3](https://user-images.githubusercontent.com/91024338/135767226-04ee4d0c-c932-404a-b2c9-4d067ce869d1.PNG)
![image](https://user-images.githubusercontent.com/91024338/135767416-ec1b27ff-4bbe-4c90-b521-2c3d2c5c8144.png)


The playbook files are .yml files that can be run with ansible. 
They are located in /etc/ansible/roles/filebeat-playbook.yml.
Copy the file into a container where ansible is installed to be deployed.
Update the hosts file in order for Ansible to run the playbook on a specific machine.
In the hosts file you can specify where you want resources to be installed under the specific machines grouping category. You can specify which machine to install the ELK server 
on versus which to install the Filebeat on. 
Navigate to http://20.58.247.221:5601/app/kibana, to verify the ELK server is running. 

The following are the specific commands the user will need to run the playbook, download the playbook, update the files, etc.
- Download the ansible.cfg file 
![Ansible_configuration_file](https://user-images.githubusercontent.com/91024338/135768185-9feaf2d8-664c-491f-9a45-75a46d004af1.PNG)
![Ansible_configuration_file_1](https://user-images.githubusercontent.com/91024338/135768187-c0204227-9bdc-4d61-83da-6e41c05c2c0c.PNG)
![Ansible_configuration_file_2](https://user-images.githubusercontent.com/91024338/135768193-802ae3d9-14b6-4367-bbb9-30010ca36afd.PNG)
![Ansible_configuration_file_3](https://user-images.githubusercontent.com/91024338/135768209-b9bfef7d-6af3-4654-a30e-fdd77581eea5.PNG)
![Ansible_configuration_file_4](https://user-images.githubusercontent.com/91024338/135768214-0f160716-0559-4642-aada-7fe90ef112e6.PNG)
![Ansible_configuration_file_5](https://user-images.githubusercontent.com/91024338/135768221-deebdf52-7e30-47ab-baf8-a4f475755ec1.PNG)
![Ansible_configuration_file_6](https://user-images.githubusercontent.com/91024338/135768223-8c49c10f-aaa3-45ef-8338-e70e4136dc6b.PNG)
![Ansible_configuration_file_7](https://user-images.githubusercontent.com/91024338/135768226-6617fc21-b5f7-4d6b-85bc-8897ea60950d.PNG)
![Ansible_configuration_file_8](https://user-images.githubusercontent.com/91024338/135768232-03525a6d-8527-4090-9334-eceff76fbd8b.PNG)

- Add the remote_user to the ansible.cfg file
![Ansible_configuration_file_1](https://user-images.githubusercontent.com/91024338/135768242-4c74f9af-4985-4480-9c00-12839da3cd0d.PNG)

- Add the VM that you want to use to run your ELK stack in the hosts file
  /etc/ansible/hosts , specify python with ansible_python_interpreter=/usr/bin/python3.
![Project 1 6 1](https://user-images.githubusercontent.com/91024338/135767207-f67c8b12-0144-4a12-a733-bf5494043fcf.PNG)

- Create a new playbook: 
  touch /etc/ansible/install-elk.yml 
![install_elk_yml](https://user-images.githubusercontent.com/91024338/135767285-caf1ed76-d88e-493c-a86b-b0a8e4aa240e.PNG)


Run the following commands to confirm the container is running and the playbook has updated properly:
- sudo docker start <container name>
- sudo docker ps
- sudo docker exec -ti <container name> bash
- sudo ansible-playbook <file_name.yml> 


